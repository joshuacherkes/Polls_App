class Poll < ActiveRecord::Base
  attr_accessible :user_id
  has_many :questions
  has_many :answers, :through => :questions

  def add_questions(title, *others)
    Question.create(:title => title , :poll_id => self.id)
    others.each do |other|
      Question.create(:title => other , :poll_id => self.id)
    end
  end

  def poll_results
    results = []
    questions.each do |question|

      results << [question.title, question.question_results]
    end
    results
  end


end