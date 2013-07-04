class User < ActiveRecord::Base
  attr_accessible :name
  has_many :votes
  has_many :polls

  validates :name, :presence => true, :uniqueness => true

end