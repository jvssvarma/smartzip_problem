class CampaignRespondent < ApplicationRecord
  belongs_to :campaign
  belongs_to :respondent
end
