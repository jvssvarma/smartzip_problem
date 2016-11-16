class Campaign < ApplicationRecord
  belongs_to :user
  has_many :campaign_respondents

  validates_presence_of :name
  validates_presence_of :typeof
  validates_presence_of :user_id
end
