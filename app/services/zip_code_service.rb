class ZipCodeService
  def initialize(zip)
    @zip = zip
  end
  
  def zip_code
    get_json(@zip)
  end

private

  def conn
    Faraday.new("https://www.zipcodeapi.com/rest/#{ENV['ZIPCODE_API_KEY']}/info.json")
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
