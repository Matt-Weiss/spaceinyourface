class TelescopeTrackJob
  include Sidekiq::Worker

  def perform(ngrok_url, user_coordinates, body_name)
    ephemeris_data = SkyfieldService.new(user_coordinates, body_name, "telescope_tracking")
    motion = NgrokService.new(ngrok_url, ephemeris_data)
    motion.conn
  end
end
