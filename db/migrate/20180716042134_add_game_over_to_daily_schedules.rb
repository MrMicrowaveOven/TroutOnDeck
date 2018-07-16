class AddGameOverToDailySchedules < ActiveRecord::Migration[5.1]
  def change
    add_column :daily_schedules, :game_over, :boolean, default: false
  end
end
