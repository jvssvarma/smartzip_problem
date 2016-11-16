class Respondent < ApplicationRecord
  belongs_to :user
  has_many :campaign_respondents

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :phone_number
  validates_presence_of :user_id
end
