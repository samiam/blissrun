class SessionController < ActionController::Base

  # Change to use a file in /etc
  def login
    if request.post? and params[:user]
      if (params[:user][:username] == "test" and
          params[:user][:password] == "mindfulness")
        session[:user_id] = "1"
        redirect_to :controller => "home", :action => "index"
      else
        flash[:notice] = "Invalid username/password combination."
      end
    end
  end

end
