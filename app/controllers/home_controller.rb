class HomeController < ActionController::Base

  before_filter :login

  def home
  end

  def about
  end

  def meetings
    @map = %q(<iframe width="300" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=2685+E+Livingston+Ave+Columbus+OH+43209&amp;sll=39.947072,-82.925663&amp;sspn=0.0114,0.021865&amp;ie=UTF8&amp;ll=39.954951,-82.922487&amp;spn=0.019738,0.025749&amp;z=14&amp;iwloc=addr&amp;output=embed"></iframe>)
    @map_link = %q(http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=2685+E+Livingston+Ave+Columbus+OH+43209&amp;sll=39.947072,-82.925663&amp;sspn=0.0114,0.021865&amp;ie=UTF8&amp;ll=39.954951,-82.922487&amp;spn=0.019738,0.025749&amp;z=14&amp;iwloc=addr&amp;output=embed)
    @link = %q(<a href="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=2685+E+Livingston+Ave+Columbus+OH+43209&amp;sll=39.947072,-82.925663&amp;sspn=0.0114,0.021865&amp;ie=UTF8&amp;ll=39.954951,-82.922487&amp;spn=0.019738,0.025749&amp;z=14&amp;iwloc=addr" style="color:#0000FF;text-align:left">View Larger Map</a>)
    @link2 =%q(<a id="vlm" href="http://maps.google.com/maps?hl=en&amp;q=2685+E+Livingston+Ave+Columbus,+OH+43209&amp;ie=UTF8&amp;ll=39.947977,-82.925062&amp;spn=0.01974,0.025749&amp;z=14&amp;source=embed" target="_blank">View Larger Map</a>)
  end

  def resources
  end

  def contact
  end

  def calendar
  end

  def login
    if ! user_logged_in?
      redirect_to login_url
    end
  end

  def logout
    reset_session
    redirect_to root_url
  end
  
  private

  def user_logged_in?
    return session[:user_id] != nil
  end

end
