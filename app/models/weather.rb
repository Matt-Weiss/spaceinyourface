class Weather
  attr_reader :time,
              :summary,
              :icon,
              :temperature,
              :cloud_cover_percentage,
              :precipProbability

  def initialize(attribute)
    @time = Time.at(attribute[:time]).strftime("%I %p")
    @summary = attribute[:summary]
    @icon = icons[:"#{attribute[:icon]}"]
    @temperature = attribute[:temperature].to_i
    @cloud_cover_percentage = (attribute[:cloudCover] * 100).to_i
    @precipProbability = (attribute[:precipProbability] * 100).to_i
  end

  def icons
    {
      'clear-day': 'http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/32/Status-weather-clear-icon.png',
      'clear-night': 'http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/32/Status-weather-clear-night-icon.png',
      'rain': 'http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/32/Status-weather-showers-icon.png',
      'snow': 'http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/32/Status-weather-snow-icon.png',
      'sleet': 'http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/32/Status-weather-snow-rain-icon.png',
      'wind': 'http://icons.iconarchive.com/icons/handdrawngoods/sunny-weather/32/07-wind-breeze-icon.png',
      'fog': 'http://icons.iconarchive.com/icons/custom-icon-design/weather/32/fog-icon.png',
      'cloudy': 'http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/32/Status-weather-many-clouds-icon.png',
      'partly-cloudy-day': 'http://icons.iconarchive.com/icons/large-icons/large-weather/32/partly-cloudy-day-icon.png',
      'partly-cloudy-night': 'http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/32/Status-weather-clouds-night-icon.png',
      'hail': 'http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/32/Status-weather-hail-icon.png',
      'thunderstorm': 'http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/32/Status-weather-storm-night-icon.png',
      'tornado': 'http://icons.iconarchive.com/icons/large-icons/large-weather/32/tornado-icon.png'
    }
  end
end
