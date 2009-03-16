class HomeController < ActionController::Base

=begin
  require 'rubygems'
  require 'static_gmaps'
=end
  
  def index
  end

  def about
    # split into two columns: where we meet on right
    # 
  end
  def contact
  end
  def events

=begin
 @map = StaticGmaps::Map.new :center   => [ 40.714728, -73.998672 ],
                             :zoom     => 5,
                             :size     => [ 500, 400 ],
                             :map_type => :roadmap,
                             :key      => "ABQIAAAAblLL4Q3z4NFhu2KEhMgitxTJQa0g3IQ9GZqIMmInSLzwtGDKaBR94Tv-HU8GYtcGARFca8AQoFV1Iw"

#  map.markers << StaticGmaps::Marker.new(:latitude => 40,
#                                         :longitude => -73,
#                                         :color => :blue,
#                                         :alpha_character => :b)
    
    @map.url
=end

  end
end
