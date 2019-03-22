#controller to authentication path
class AuthenticationController < ApplicationController
 skip_before_action :authenticate_request

 # authenticate user based on email and password params
 # returns token json in sucess
 # returns errors json in failure
 def authenticate
   command = AuthenticateUser.call(params[:email], params[:password])

   if command.success?
     render json: { auth_token: command.result }
   else
     render json: { error: command.errors }, status: :unauthorized
   end
 end
end