# class to autorize request based on token
class AuthorizeApiRequest
  # import mandatory requisits
  prepend SimpleCommand

  # receive request headers in object initializer
  def initialize(headers = {})
    @headers = headers
  end

  # returns user from token found in request headers
  # include errors in user object when the token is invalid
  def call
    user
  end

  private

  attr_reader :headers

  # find user from user id in decoded token
  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || errors.add(:token, 'Invalid token') && nil
  end

  # decode token from extracted header 
  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  # extract authorization header from token
  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      errors.add(:token, 'Missing token')
    end
    nil
  end
end