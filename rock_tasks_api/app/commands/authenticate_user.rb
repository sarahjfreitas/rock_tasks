# token authentication class
class AuthenticateUser
  prepend SimpleCommand

  # set object email and password
  def initialize(email, password)
    @email = email
    @password = password
  end

  #encode token with user id
  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password

  # find and authenticate user with email and password
  def user
    user = User.find_by_email(email)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end