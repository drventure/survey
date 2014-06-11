class Question < ActiveRecord::Base
  belongs_to :poll
  has_many :answers
  has_many :responses
  accepts_nested_attributes_for :answers, allow_destroy: true
end
