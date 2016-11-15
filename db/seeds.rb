# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.first

Campaign.create(user_id: @user.id, name: "Mail Contact", typeof: "DirectMailCampaign")
Campaign.create(user_id: @user.id, name: "Online Ads", typeof: "AdsCampaign")

Respondent.create(user_id: @user.id, name: "Paris Hilton", email: "paris.hilton@smartzipcustomer.com", phone_number: "424-424-9995")
Respondent.create(user_id: @user.id, name: "Justin Timberlake", email: "justin.timberlake@smartzipcustomer.com", phone_number: "419-454-8875")
Respondent.create(user_id: @user.id, name: "Alexandria Daddario", email: "daddario@smartzipcustomer.com", phone_number: "979-193-2345")
Respondent.create(user_id: @user.id, name: "John Doe", email: "john.doe@smartzipcustomer.com", phone_number: "444-454-2345")
Respondent.create(user_id: @user.id, name: "Jane Doe", email: "jane.doe@smartzipcustomer.com", phone_number: "545-454-2345")
Respondent.create(user_id: @user.id, name: "Johnny Bravo", email: "johnny.bravo@smartzipcustomer.com", phone_number: "767-454-2345")
Respondent.create(user_id: @user.id, name: "Popeye Sailorman", email: "popeye.sailorman@smartzipcustomer.com", phone_number: "000-454-2345")

CampaignRespondent.create(campaign_id: 1, respondent_id: 1)
CampaignRespondent.create(campaign_id: 1, respondent_id: 2)
CampaignRespondent.create(campaign_id: 1, respondent_id: 4)
CampaignRespondent.create(campaign_id: 1, respondent_id: 5)
CampaignRespondent.create(campaign_id: 2, respondent_id: 3)
CampaignRespondent.create(campaign_id: 2, respondent_id: 6)
CampaignRespondent.create(campaign_id: 2, respondent_id: 7)
