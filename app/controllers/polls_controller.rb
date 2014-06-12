class PollsController < ApplicationController
  def take
    @poll = Poll.find(params[:id])
  end


  def index
    @polls = Poll.all
  end


  def submit
    # grab just the question answers
    answers = params.select{ |k, v| k.starts_with?('question_')}
    # grab just the question id's and each answer
    answers = answers.each_with_object({}) {|(k, v), h| h[k.split('_')[1].to_i] = v}

    #create responses from each
    answers.each do |k, v|
      #retrieve the question to verify the type
      question = Question.find(k)
      if !!question then
        if question.question_type == 0 then
          #multiple choice
          Response.create({question_id: k, answer_id: v})
        else
          #free response
          Response.create({question_id: k, response: v})
        end
      end
    end
  end


  def chart
    @poll = Poll.find(params[:id])
    @choice_data = []
    @free_data = []
    @poll.questions.each { |q|
      if q.question_type == 0 then
        #only multi choice graphs right now
        d = q.responses.joins(:answer).group(:answer).count
        d = d.each_with_object({}) {|(k, v), h| h[k.answer] = v}
        @choice_data.push({name: q.question, data: d})
      else
        #free response question
        d = q.responses.group(:response).count
        @free_data.push({question: q.question, data: d})
      end
    }
  end
end
