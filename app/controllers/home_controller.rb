# Test site w/o css turned on
# Test site w/o javascript turned on
# Test side w/images blocked
# Google analytics?

require 'base64'

class HomeController < ApplicationController

  def home
  end

  def about
  end

  def meetings
    # 360(w) x 400(h), change iframe -> object, strip other attrs
    @map = %q(
      <object data="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d13345.004751854502!2d-82.99852404112917!3d40.06019207556962!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88388b814486f4a7%3A0x9a83990db4ea7656!2s4211+Maize+Rd%2C+Columbus%2C+OH+43224!5e0!3m2!1sen!2sus!4v1549933654254" width="360" height="400"></object>
    )
  end

  def calendar
  end

  def resources
  end

  def contact
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
