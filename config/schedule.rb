set :environment, "development"
set :output, "log/cron.log"

every :day, at: '11:00pm' do
  runner "CalculateRewardsJob.perform_now"
end



# bundle exec bin/rails runner -e development CalculateRewardsJob.perform_now >> log/cron.log 2>&1

# every 5.minutes do
#   runner "CalculateRewardsJob.perform_now"
# end
