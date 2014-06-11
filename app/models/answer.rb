class Answer < ActiveRecord::Base
  attr_accessible :answer

  belongs_to :question
  has_many :responses
end
