class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActionController::ParameterMissing, :with => :parameter_missing_error_handler

  def parameter_missing_error_handler
    respond_to do |type|
      type.xml { render :template => "errors/error_400", :status => 400 }
      type.all  { render :nothing => true, :status => 400 }
    end
    true
  end

end
