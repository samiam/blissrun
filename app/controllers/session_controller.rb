class SessionController < ActionController::Base

  def login
    if request.post? and params[:user]
      if (params[:user][:username] == "diane" and
          params[:user][:password] == "mindfulness")
        session[:user_id] = "1"
        redirect_to :controller => "home", :action => "index"
      else
        flash[:notice] = "Invalid username/password combination."
      end
    end
  end

end
