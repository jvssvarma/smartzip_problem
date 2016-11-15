class CreateCampaignRespondents < ActiveRecord::Migration[5.0]
  def change
    create_table :campaign_respondents do |t|
      t.references :campaign, foreign_key: true
      t.references :respondent, foreign_key: true
      t.string :keycode
    end
  end
end
