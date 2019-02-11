class ApplicationController < ActionController::Base
  before_action :redirect_to_www

  private

  def redirect_to_www
    if request.host == "blissrun.org"
      redirect_to url_for( :host => "www.blissrun.org" )
    end
  end
end
