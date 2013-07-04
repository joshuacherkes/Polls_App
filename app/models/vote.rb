class Vote < ActiveRecord::Base
  attr_accessible :user_id, :question_id, :answer_id
  belongs_to :answer
  belongs_to :user
end