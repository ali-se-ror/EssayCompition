# README

* rails db:create
* rails db:migrate
* open localhost:3000
* you will see rewards agaisnt the essays but initially those will be empty so click on new essay
* that will lead you to create user and then create essay

# Test point calculations

* bundle exec bin/rails runner -e development CalculateRewardsJob.perform_now >> log/cron.log 2>&1
* it will calculate the points and positions against each user essays. if there is a tie like to people are in sam eposition it will make them on first position for both of them.
* cron is setup into schedule.rb file for each day at 10pm
* to write the cron enter this into terminal "whenever --update-crontab"
