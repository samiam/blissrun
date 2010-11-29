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

    @map = %q(
             <iframe width="350" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=4211+Maize+Road+Columbus,+OH+43224&amp;sll=40.051618,-82.989158&amp;sspn=0.010841,0.013905&amp;g=4211+Maize+Road+r+Columbus,+OH+43224&amp;ie=UTF8&amp;hq=&amp;hnear=4211+Maize+Rd,+Columbus,+Franklin,+Ohio+43224&amp;ll=40.056724,-82.98789&amp;spn=0.026278,0.029955&amp;z=14&amp;iwloc=A&amp;output=embed"></iframe>
             )
    @larger_map_link = %q(
             <a href="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=4211+Maize+Road+Columbus,+OH+43224&amp;sll=40.051618,-82.989158&amp;sspn=0.010841,0.013905&amp;g=4211+Maize+Road+r+Columbus,+OH+43224&amp;ie=UTF8&amp;hq=&amp;hnear=4211+Maize+Rd,+Columbus,+Franklin,+Ohio+43224&amp;ll=40.056724,-82.98789&amp;spn=0.026278,0.029955&amp;z=14&amp;iwloc=A" style="color:#0000FF;text-align:left">View Larger Map</a>
             )
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
