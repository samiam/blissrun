# Test site w/o css turned on
# Test site w/o javascript turned on
# Test side w/images blocked
# Google analytics?

class HomeController < ActionController::Base

#  before_filter :login
  before_filter :redirect_to_www

  def home
    @page_title = "Home"
  end

  def about
    @page_title = "About Us"
  end

  def meetings
    @page_title = "Meetings and Events"

    @map = %q(<iframe width="300" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=2685+E+Livingston+Ave+Columbus+OH+43209&amp;sll=39.947072,-82.925663&amp;sspn=0.0114,0.021865&amp;ie=UTF8&amp;ll=39.954951,-82.922487&amp;spn=0.019738,0.025749&amp;z=14&amp;iwloc=addr&amp;output=embed"></iframe>)
    @larger_map_link = %q(<a href="http://maps.google.com/maps?hl=en&amp;q=2685+E+Livingston+Ave+Columbus,+OH+43209&amp;ie=UTF8&amp;ll=39.947977,-82.925062&amp;spn=0.01974,0.025749&amp;z=14&amp;source=embed" target="_blank">View Larger Map</a>)
  end

  def calendar
    @page_title = "Calendar"
  end

  def resources
    @page_title = "Resources"
  end

  def contact
    @page_title = "Contact"
  end

  def addresses
    redirect_to root_url unless request.xhr?
    @captcha_ans = verify_recaptcha
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

  def redirect_to_www
    if request.host == "blissrun.org"
      redirect_to url_for( :host => "www.blissrun.org" )
    end
  end

end
