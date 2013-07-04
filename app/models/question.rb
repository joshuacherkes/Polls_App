class Question < ActiveRecord::Base
  attr_accessible :title, :poll_id
  belongs_to :poll
  has_many :answers


  validates :title, :presence => true

end