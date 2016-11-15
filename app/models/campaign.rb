class Campaign < ApplicationRecord
  belongs_to :user
  has_many :campaign_respondents
end
