class Poll < ActiveRecord::Base
  attr_accessible :user_id
  has_many :questions



end