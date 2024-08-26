class JsonWebToken
  def self.encode(payload)
    exp = 24.hours.from_now
    payload[:exp] = exp.to_i
    JWT.encode(payload, ENV['JWT_SECRET_KEY'])
  end

  def self.decode(token)
    body = JWT.decode(token, ENV['JWT_SECRET_KEY']).first
    HashWithIndifferentAccess.new body
  rescue
    nil
  end
end
