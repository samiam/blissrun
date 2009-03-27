=begin
  require 'rubygems'
  require 'static_gmaps'
=end

class HomeController < ActionController::Base

  before_filter :login, :except => :login

  def index
  end

  def about
    # split into two columns: where we meet on right
    # 
  end
  def meetings
    @map = %q(<iframe width="300" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=2685+E+Livingston+Ave+Columbus+OH+43209&amp;sll=39.947072,-82.925663&amp;sspn=0.0114,0.021865&amp;ie=UTF8&amp;ll=39.954951,-82.922487&amp;spn=0.019738,0.025749&amp;z=14&amp;iwloc=addr&amp;output=embed"></iframe>)
    @link = %q(<a href="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=2685+E+Livingston+Ave+Columbus+OH+43209&amp;sll=39.947072,-82.925663&amp;sspn=0.0114,0.021865&amp;ie=UTF8&amp;ll=39.954951,-82.922487&amp;spn=0.019738,0.025749&amp;z=14&amp;iwloc=addr" style="color:#0000FF;text-align:left">View Larger Map</a>)
    @link2 =%q(<a id="vlm" href="http://maps.google.com/maps?hl=en&amp;q=2685+E+Livingston+Ave+Columbus,+OH+43209&amp;ie=UTF8&amp;ll=39.947977,-82.925062&amp;spn=0.01974,0.025749&amp;z=14&amp;source=embed" target="_blank">View Larger Map</a>)

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
  def resources
  end
  def contact
  end

  def lab
  end
  def login
  end
  private
  def login
    flash[:notice] = "Login required"
    session[:return_to] = request.request_uri  
    redirect_to :login
#    login_path  
  end

end
