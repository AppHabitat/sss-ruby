require 'digest'
require 'time'
require 'querystring'
require 'openssl'

module ScreenshotShark

  extend self

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

  def build_url options = {}
    defaults = {
      :key      => self.api_key,
      :gravity  => 'north',
      :viewport => '1024x768',
      :full     => false,
      :url      => 'http://www.google.com/',
      :op       => 'r:200:120'
    }
    options = defaults.merge options

    options[:token] = hash options

    qs = QueryString.stringify options
    "http://www.screenshotshark.com/capture?#{qs}"
  end

  def hash options
    h = "#{options[:key]}:#{options[:url]}:#{options[:op]}"
    OpenSSL::HMAC.hexdigest('sha1', self.secret, h)
  end
end