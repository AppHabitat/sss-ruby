module ScreenshotShark
  module Helpers

    # Create an image URL for the specified website
    def sss_image_url url, options = {}
      options[:url] = url
      Builder.new(options).build_url()
    end

    # Create an image tag for the specified website
    def sss_image_tag url, options = {}
      options[:url] = url
      url = Builder.new(options).build_url()
      '<img src="#{url}">'
    end
  end
end