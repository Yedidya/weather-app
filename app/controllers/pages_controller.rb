

class PagesController < ApplicationController

  def weather
    @time = Time.now

    @formatted_time = "#{format_time(@time.year)}-#{format_time(@time.month)}-#{format_time(@time.day)}T#{format_time(@time.hour)}:#{format_time(@time.min)}:#{format_time(@time.sec)}-0400"
      
    @results = Unirest.get("https://api.forecast.io/forecast/b36dc3b2dba43edd87bea86dd50d2973/37.8267,-122.423,#{@formatted_time}",
      :headers => {"Accept" => "application/json"}).body
     
    @temp = @results["currently"]["temperature"]
    #request.remote_ip
  end

  def format_time(time)
   time.to_s.rjust(2,"0") 
  end

end 


