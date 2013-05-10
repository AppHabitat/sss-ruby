# ScreenshotShark in Ruby

![Screenshot Shark](http://screenshotshark.com/images/logo.png)

This is the Ruby (Rails compatible) library for creating screenshot URLs using the Screenshot Shark service.

```ruby

ScreenshotShark.config 'api_key', 'secret'

opts =
  url: 'http://www.google.com'
  op:  'f:200:200'

ScreenshotShark.build_url opts
```

Check out [Screenshot Shark](http://www.screenshotshark.com) for all your screenshotting needs.
