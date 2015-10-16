require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather_form
    # Nothing to do here.
    render("coords_to_weather_form.html.erb")
  end

  def coords_to_weather
    @lat = params[:user_latitude]
    @lng = params[:user_longitude]

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================

    @url_2 = "https://api.forecast.io/forecast/0ad9a369db64bb5a9f355ac6df79153c/" + @lat  +"," + @lng

    @parsed_data_2 = JSON.parse(open(@url_2).read)

    @current_temperature = @parsed_data_2["currently"]["temperature"]

    @current_summary = @parsed_data_2["currently"]["summary"]

    @summary_of_next_sixty_minutes = @parsed_data_2["minutely"]["summary"]

    @summary_of_next_several_hours = @parsed_data_2["hourly"]["summary"]

    @summary_of_next_several_days = @parsed_data_2["daily"]["summary"]

    render("coords_to_weather.html.erb")
  end
end
