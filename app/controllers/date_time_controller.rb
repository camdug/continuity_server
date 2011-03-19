class DateTimeController < ApplicationController

  respond_to :html, :json

  def get
    time_zone = params[:time_zone]
    
    if (time_zone.nil?)
      @time = DateTime.now
    else
      @time = DateTime.now.change(:offset => Time.zone_offset(time_zone))
    end
    
    respond_with(@time)
  end
end
