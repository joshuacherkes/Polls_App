class Answer < ActiveRecord::Base
  attr_accessible :body, :question_id
  belongs_to :question
  has_one :poll, :through => :question
  has_many :votes

  validates :body, :presence => true

end