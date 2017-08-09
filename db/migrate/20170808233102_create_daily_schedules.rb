class CreateDailySchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_schedules do |t|
      t.string :game_id
      t.datetime :game_time
      t.timestamps
    end
  end
end
