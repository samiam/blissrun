# Test site w/o css turned on
# Test site w/o javascript turned on
# Test side w/images blocked
# Add reCaptcha to contact page
# Google analytics

class HomeController < ActionController::Base

  before_filter :login

  def home
    @page_title = "Home"
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
    @page_title = "Resources"
  end

  def contact
    @subscribe = "&#x6d;&#x69;&#x6e;&#x64;&#x66;&#x75;&#x6c;&#x6e;&#x65;&#x73;&#x73;&#x2d;&#x73;&#x75;&#x62;&#x73;&#x63;&#x72;&#x69;&#x62;&#x65;&#x20;&#x40;&#x20;&#x62;&#x6c;&#x69;&#x73;&#x73;&#x72;&#x75;&#x6e;&#x2e;&#x6f;&#x72;&#x67;"
    @unsubscribe = "&#x6d;&#x69;&#x6e;&#x64;&#x66;&#x75;&#x6c;&#x6e;&#x65;&#x73;&#x73;&#x2d;&#x75;&#x6e;&#x73;&#x75;&#x62;&#x73;&#x63;&#x72;&#x69;&#x62;&#x65;&#x20;&#x40;&#x20;&#x62;&#x6c;&#x69;&#x73;&#x73;&#x72;&#x75;&#x6e;&#x2e;&#x6f;&#x72;&#x67;"
    # Spam methods
    # Use temporary mailbox
    # Use plussed addresses
=begin

    <script language="JavaScript">
document.write('<a h'+'ref="m'+'ailt'+'o:'+'%66%6f%6f%40%62%61%72%2e%63%6f%6d">&#112;&#112;&#112;<\/a>');
</script>
=end
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
