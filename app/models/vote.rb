class Vote < ActiveRecord::Base
  attr_accessible :user_id, :answer_id
  belongs_to :answer
  belongs_to :user
  has_one :question, :through => :answer

  validates :answer_id, :uniqueness => true
  validate :can_not_answer_twice
  validate :can_not_vote_on_own_poll

  def can_not_answer_twice
    result = false
    thing = self.answer.id # Answer.find_by_id(self.answer_id).question.id
   Vote.where(:user_id => self.user_id).includes(:question).each do |vote|
      if vote.question.id == thing
        result = true
      end
    end
    errors[:base] << "Can't vote on the same question twice" if result
  end

  def can_not_vote_on_own_poll
    result = Poll.where(:user_id => self.user_id).select do |poll|
      poll == Answer.find_by_id(self.answer_id).poll
    end
    if result.empty?
      errors[:base] << "Can't vote on own question/poll"
    end
  end


end






    #user already answered an answer for the question
    #that answer has an associated question
    #when we validate an attempt to vote, we need to see if the user has voted
    #on that same question.
    #so. Vote.create(:user_id, :answer_id => 2)
    #Answer.find_by_id(2).question Votes.find_by_user_id.
