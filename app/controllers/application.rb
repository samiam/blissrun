# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '6bda34f13e041f8c328666200702ec26'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

  def flash_div *keys
    keys.collect { |key| 
      content_tag(:div, 
        content_tag(:h1, key.to_s.capitalize) << flash[key],
        :class => "flash flash_#{key}", 
        :onClick => "new Effect.DropOut(this)") if flash[key] 
    }.join
  end

end
