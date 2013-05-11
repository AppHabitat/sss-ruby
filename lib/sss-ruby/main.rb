require 'openssl'

module ScreenshotShark

  # Cheap singleton
  extend self

  # Set API and secret keys
  def config api_key, secret
    self.api_key = api_key
    self.secret  = secret
  end

  def api_key= api_key
    @api_key = api_key
  end

  def api_key
    raise 'API key not set.' unless @api_key
    @api_key
  end

  def secret= secret
    @secret = secret
  end

  def secret
    raise 'Secret key not set.' unless @secret
    @secret
  end

  # Build a HMAC-SHA1 hash for token
  def hash options
    h = "#{options[:key]}:#{options[:url]}:#{options[:op]}"
    OpenSSL::HMAC.hexdigest('sha1', self.secret, h)
  end

end