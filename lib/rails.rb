require './sss-ruby'

ActionView::Base.send(:include, ScreenshotShark::Helpers) if defined? ActionView