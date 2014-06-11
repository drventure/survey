class Question < ActiveRecord::Base
  attr_accessible :question

  belongs_to :poll
  has_many :answers
end
