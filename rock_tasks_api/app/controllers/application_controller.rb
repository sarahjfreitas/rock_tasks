#controllers parent class
class ApplicationController < ActionController::API
  # json responses handler
  include Response
  
  # custom exceptions handler 
  include ExceptionHandler
end
