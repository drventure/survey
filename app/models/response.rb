class Response < ActiveRecord::Base
  belongs_to :answer
  belongs_to :question

  def answer_text
    self.answer.answer
  end
end
