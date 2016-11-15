### SmartZip Problem Answers

- 1. SQL Syntax
  - (a) All users in the System (id, email) and how many campaigns each of them have.

  ```
  SELECT User.id AS UserId, User.email AS UserEmail, (SELECT count(*) FROM Campaign WHERE user_id = User.id) AS NumberOfCampaigns
  FROM User;
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
  (d) For each user, what's the average respondent count across campaigns

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

- 2. (a),(b),(d),(e),(f) are done in the application.
- 2. (c) Why would you use references on foreign keys?
  This is to maintain data integrity by implementing referential integrity. This ensures relationship between rows in two models will remain synchronized during updates and deletes. These key constraints are another way of helping in avoiding unexpected 'nil' and maintain valid data.

- 3. ActiveRecord Queries

- 4, 5, 6, 7, 9 Implemented in the application

- 10. Are there any other gem you'd like to use as part of this project and why? Any other Suggestions?
  If time persists, I would've added 'pundit' for authorization and 'Arel' for better understanding of SQL and ActiveRecord Queries.

### SmartZip Self-Assessment

- How do you think you did on the first series of questions?
  Considering the limited time I had, pretty well. I would like to work more on the ActiveRecord Queries to make it my strength instead of my weakness and liked the questions complexity. Specially the SQL Queries part, made me work on one of my least used knowledge i.e., SQL Queries.

- How do you think you did on the app?
  Again, considering the limited time I had, pretty well. However, I think there is a lot of room for improvement. If I had more time, the models could've been managed better. Also, would've built the application in Test First Development.

- Self-Assessment
  On a scale of 1 to 10, how would you rate your
  * Database design skills - 5 (Considering there's a great scope of learning)
  * Ruby on Rails Proficiency - 6 (I've built really simple to mid-level complex apps, so I still don't consider myself great)
  * jQuery/CSS Development - [jQuery - 6, CSS - 8] My understanding and working with jQuery is good and SCSS is more familiar to me than CSS now.

- What will you do to improve your level of expertise?
  I practice a lot, more than once. I love to learn, so anything that I like and want to learn is noted and materials are bookmarked so that I can go through it when I want to learn. I prefer practical approach to any new things I learn, it gives me confidence at my work. I make sure that I practice a method or concept many times such that I need not require reference in future. Just like I implement devise or paperclip, for which I don't need document reference for the basic implemtations.

- Why should we hire you vs. another developer?
  Because, I am a good fit for this position. I'm not perfect but I have what it takes to perform the tasks and get the job done. Nothing excites me more than working in an team and work that keeps my mind busy.
