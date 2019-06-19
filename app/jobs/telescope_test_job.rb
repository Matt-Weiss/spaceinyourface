class TelescopeTestJob
  include Sidekiq::Worker

  def perform(ngrok_url)
    NgrokService.test_conn(ngrok_url)
  end
end
