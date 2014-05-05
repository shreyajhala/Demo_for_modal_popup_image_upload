class SessionsController < Devise::SessionsController
  before_action :failure, :only => [:create]
  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    sign_in(resource_name, resource)    
  end

  def failure
    if (!params[:user][:password].present?) || (!params[:user][:login].present?)
      render :js => "$('#error_message').html('Email or Password cannot be Blank');"
    end
  end
end