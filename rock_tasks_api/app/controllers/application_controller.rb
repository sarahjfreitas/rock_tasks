#controllers parent class
class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  # json responses handler
  include Response
  
  # custom exceptions handler 
  include ExceptionHandler

 
  private
 
  #verify if request has valid token
  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

end
