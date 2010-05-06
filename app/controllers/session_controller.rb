class SessionController < ActionController::Base

  # Change to use a file in /etc
  def login
    if request.post? and params[:user]
      if (params[:user][:username] == "test" and
          params[:user][:password] == "test")
        session[:user_id] = "1"
        flash[:notice] = nil
        redirect_to root_url
      else
        flash[:notice] = "Invalid username/password combination."
      end
    end
  end

end
