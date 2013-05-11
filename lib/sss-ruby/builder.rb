require 'querystring'

module ScreenshotShark

  class Builder

    # Create new instance with options
    def initialize options
      @options = options
    end

    # Build screenshot URL
    def build_url
      defaults = {
        :key      => ScreenshotShark.api_key,
        :url      => 'http://www.google.com/',
        :op       => 'r:200:120'
      }
      options = defaults.merge @options
      options[:token] = ScreenshotShark.hash options
      qs = QueryString.stringify options
      "http://screenshotshark.com/capture?#{qs}"
    end

  end

end