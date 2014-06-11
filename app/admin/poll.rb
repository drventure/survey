ActiveAdmin.register Poll do
  permit_params :name,
                :questions,
                questions_attributes: [:id,
                                       :question,
                                       :question_type,
                                       :_destroy,
                                       :answers,
                                       answers_attributes: [:id,
                                                            :answer,
                                                            :_destroy]]

  form do |f|
    #show any errors here
    f.semantic_errors *f.object.errors.keys

    f.inputs "Poll Details" do
      f.input :name, prompt: "Poll name"
    end

    f.inputs "Questions" do
      f.has_many :questions do |q|
        q.input :question
        q.input :question_type, :label => 'Type', :as => :select, :collection => {'Multiple Choice' => 0, 'Free Response' => 1}
        q.inputs do
          q.has_many :answers do |a|
            a.input :answer
            if a.object.new_record?
              a.input :_destroy, :as => :hidden
            else
              a.input :_destroy, :as => :boolean
            end
          end
        end
        if q.object.new_record?
          q.input :_destroy, :as => :hidden
        else
          q.input :_destroy, :as => :boolean
        end
      end
    end

    f.actions
  end
end
