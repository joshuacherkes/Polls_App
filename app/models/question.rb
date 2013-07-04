class Question < ActiveRecord::Base
  attr_accessible :title, :poll_id
  belongs_to :poll
  has_many :answers
  has_many :votes, :through => :answers


  validates :title, :presence => true

  def add_answers(body, *others)
    Answer.create(:body => body , :question_id => self.id)
    others.each do |other|
      Answer.create(:body => other , :question_id => self.id)
    end
  end

  def question_results
    votes = Vote.includes(:answer)
    results = []
    self.answers.each do |answer|
      results << [answer.body, votes.where(:answer_id => answer.id).count]
    end
    results
  end

end
