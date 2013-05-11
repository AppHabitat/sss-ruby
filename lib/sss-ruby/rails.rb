require File.join(File.dirname(__FILE__), 'helpers')

ActionView::Base.send(:include, ScreenshotShark::Helpers) if defined? ActionView