desc "Get the daily MLB schedule and update the database"
task :get_daily_schedule => :environment do
  DailySchedule.update_schedule
  puts "Updating schedule"
end
