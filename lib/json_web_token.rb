class JsonWebToken
  def self.encode(payload)
    JWT.encode(payload, secret)
  end

  def self.decode(token)
    ActiveSupport::HashWithIndifferentAccess.new(JWT.decode(token, secret).first)
  end

  def self.secret
    ENV['JWT_SECRET'] || 'jwtsecret'
  end

  private_class_method :secret
end
