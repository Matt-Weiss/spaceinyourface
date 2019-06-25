class PingSkyfieldJob
  include Sidekiq::Worker

  def perform
    Faraday.get 'https://skyfield-json.herokuapp.com/'
  end
end
