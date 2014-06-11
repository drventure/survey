class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :responses

  def response_count
    return self.responses.count
  end
end
