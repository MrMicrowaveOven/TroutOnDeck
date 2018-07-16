desc "Get the daily MLB schedule and update the database"
task :get_daily_schedule => :environment do
  DailySchedule.update_schedule
end

desc "Stalk Trout for 10 minutes"
task :stalk_trout_for_10_minutes => :environment do
  include StadiumHelper
  Stadium.new
end