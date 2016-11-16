class CampaignRespondent < ApplicationRecord
  belongs_to :campaign
  belongs_to :respondent

  validates_presence_of :campaign_id
  validates_presence_of :respondent_id
end
