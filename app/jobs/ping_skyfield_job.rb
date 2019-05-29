class PingSkyfieldJob < ApplicationJob
  queue_as :default

  def perform
     Faraday.get 'https://skyfield-json.herokuapp.com/'
  end
end
