class Alert < ApplicationRecord
    def self.text_sent_recently?
      last_alert = Alert.all.last
      if last_alert
        most_recent_alert_time = Alert.all.last.created_at
      else
        most_recent_alert_time = Time.new(2000,1,1)
      end

      Time.now - most_recent_alert_time < 600
    end
end
