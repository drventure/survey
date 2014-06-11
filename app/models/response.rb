class Response < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :answer
  belongs_to :user
end
