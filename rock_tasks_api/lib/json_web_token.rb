#json token manager
class JsonWebToken
  class << self
    
    # encode token receiving user id and expiration time
    # default expiration = 24.hours.form_now 
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    # decode token and returns body content
    # returns nil on failure
    def decode(token)
      body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
      HashWithIndifferentAccess.new body
    rescue
      nil
    end
  end
end