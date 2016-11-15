# SmartZip Problem Answers

- 1. SQL Syntax
  - (a) All users in the System (id, email) and how many campaigns each of them have.
  ```
  SELECT
    User.id AS UserId, User.email AS UserEmail, (SELECT count(*) FROM Campaign WHERE user_id = User.id) AS NumberOfCampaigns
  FROM
    User;
  ```
  - (b) Who are the respondents that responded to campaigns of type "DirectMailCampaign" over the past 1 month?
  ```
  SELECT Respondent.name AS RespondentName, Respondent.created AS RespondedDate, Campaign.name AS CampaignName, Campaign.type AS CampaignType
  FROM CampaignRespondent
  INNER JOIN Respondent ON CampaignRespondent.respondent_id = Respondent.id
  INNER JOIN Campaign ON CampaignRespondent.campaign_id = Campaign.id
  WHERE Campaign.type = 'DirectMailCampaign' AND Respondent.created >= now() - '1 month'::interval;
  ```
  - (c) For each user, how many keycode-respondent do they have?
  ```
  SELECT DISTINCT User.id AS UserId, User.email AS UserEmail, (SELECT count(*) CampaignRespondent WHERE keycode IS NOT NULL) AS KeycodeRespondentCount
  FROM User
  INNER JOIN Campaign ON Campaign.user_id = User.id
  INNER JOIN CampaignRespondent ON CampaignRespondent.campaign_id = Campaign.id
  WHERE KeycodeRespondentCount > 0;
  ```
  - (d) For each user, what's the average respondent count across campaigns
  ```
  SELECT DISTINCT User.id AS UserId, User.email AS UserEmail, ((SELECT count(*) WHERE Campaign.id = CampaignRespondent.campaign_id)/(SELECT count(*) WHERE Campaign.user_id = User.id)) AS AvgCampaignCount
  FROM User
  INNER JOIN Campaign ON Campaign.user_id = User.id
  INNER JOIN CampaignRespondent ON CampaignRespondent.campaign_id = Campaign.id;
  ```
  (e) Which users are missing User Profile record?
  ```
  SELECT User.id AS UserID, User.email AS UserEmail
  FROM User
  LEFT JOIN UserProfile ON UserProfile.user_id = User.id
  WHERE UserProfile.user_id IS NULL;
  ```
