class User < ActiveRecord::Base
  attr_accessible :name
  has_many :votes
  has_many :polls

  validates :name, :presence => true, :uniqueness => true

  def create_poll
    Poll.create(:user_id => self.id)
  end

  def input_vote(choice)
    v = Vote.create(:user_id => self.id, :answer_id => choice)
    raise "something went wrong" unless v.errors.empty?

  end






end