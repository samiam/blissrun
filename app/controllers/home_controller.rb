# Test site w/o css turned on
# Test site w/o javascript turned on
# Test side w/images blocked
# Google analytics?

require 'base64'

class HomeController < ApplicationController

  def home
    @page_title = "Home"
  end

  def about
    @page_title = "About Us"
  end

  def meetings
    @page_title = "Meetings and Events"

    @map = %q(
        <iframe width="350" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=4211+Maize+Road+Columbus,+OH+43224&amp;sll=40.051618,-82.989158&amp;sspn=0.010841,0.013905&amp;g=4211+Maize+Road+r+Columbus,+OH+43224&amp;ie=UTF8&amp;hq=&amp;hnear=4211+Maize+Rd,+Columbus,+Franklin,+Ohio+43224&amp;ll=40.056724,-82.98789&amp;spn=0.026278,0.029955&amp;z=14&amp;iwloc=A&amp;output=embed">
        </iframe>
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
    redirect_to contact_url unless request.xhr?
    captcha_ans = verify_recaptcha

    respond_to do |format|
      if captcha_ans
        format.js {
          render layout: false,
                 js: "document.querySelector('#recaptcha_form').innerHTML =
                        '#{email_addresses}'"
        }
      else
        format.html { redirect_to contact_url }
      end
    end
  end

  private

  def email_addresses
    template = <<-EOF
      <h2>Congratulations - you are human!</h2>
      Our email addresses:
      <p></p>
      <a href="mailto:#{addrs[0]}">#{addrs[0]}</a> (General)
      <p></p>
      <a href="mailto:#{addrs[1]}">#{addrs[1]}</a>
      <p></p>
      <a href="mailto:#{addrs[2]}">#{addrs[2]}</a>
    EOF
    template.gsub(/\n/, '')
  end

  def addrs
    ["aW5mb0BibGlzc3J1bi5vcmc=\n",
     "bWluZGZ1bG5lc3Mtc3Vic2NyaWJlQGJsaXNzcnVuLm9yZw==\n",
     "bWluZGZ1bG5lc3MtdW5zdWJzY3JpYmVAYmxpc3NydW4ub3Jn\n"].map do |e|
      Base64.decode64(e)
    end
  end
end
