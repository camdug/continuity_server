class DateTimeController < ApplicationController

  respond_to :html, :json

  def get
    time_zone = params[:time_zone]    
    seconds_in_a_day = 60*60*24;
    
    if (time_zone.nil?)
      @time = DateTime.now
    else
      @time = DateTime.now.change(:offset => Rational(Time.zone_offset(time_zone), seconds_in_a_day))
    end
    
    respond_with(@time)
  end
end
