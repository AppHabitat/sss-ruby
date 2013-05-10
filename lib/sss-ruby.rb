require 'digest'
require 'time'
require 'querystring'

module ScreenshotShark

  extend self

  def config api_key, secret
    self.api_key = api_key
    self.secret  = secret
  end

  def build_url options
    defaults = {
      :key      => self.api_key,
      :gravity  => 'north',
      :viewport => '1024x768',
      :full     => false,
      :url      => 'http://www.google.com/',
      :op       => 'r:200:120'
    }
    options = defaults.merge options

    h = "#{options[:key]}:#{options[:url]}:#{options[:op]}"
    options[:token] = OpenSSL::HMAC.digest 'sha1', self.secret_key, h

    qs = QueryString.stringify options
    "http://www.screenshotshark.com/capture?#{qs}"
  end
end

options = {}

puts ScreenshotShark.build_url(options)