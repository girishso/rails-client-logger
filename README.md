# What is that for?

Rails engine to log from Client side (Browser) javascript to server log file. To catch those nasty production Javascript errors. Provides a variety of safe logging functions e.g. jsLogger.debug(), jsLogger.error().

There are 5 levels of logging: debug, info, warn, error and fatal.

If [exception_notification](https://github.com/smartinez87/exception_notification) is found, sends
notifications for `error` and `fatal` levels.

Supports Rails 4 (permitted parameters).

For Rails 3.x use gem version `0.0.2`.

[![Gem Version](https://badge.fury.io/rb/rails-client-logger.png)](http://badge.fury.io/rb/rails-client-logger)

## Installation

Add this line to your application's Gemfile:

### For Rails 4.x
```ruby
gem 'rails-client-logger'
```

### For Rails 3.x
```ruby
gem 'rails-client-logger', '0.0.2'
```

And then execute:

```bash
$ bundle install
```

Then simply execute following generator command. It inserts the required routes and javascript files and you're ready to rock!

```bash
$ rails g rails_client_logger
```

## Usage

### Logging a message

```ruby
jsLogger.info("simple info message");
jsLogger.warn("a warning");
```

### Log Error

```ruby
try {
    throw new Error('unhandled exception');
}
catch (e) {
    jsLogger.fatal(e);
}
```

Log all unhandled javascript errors:

```javascript
window.onerror = function (message, url, line_number) {
  jsLogger.fatal("Uncaught error in: " + url + ":" + line_number + "\nDetails: " + message);
};
```

### View Logs

The logged messages will appear in the normal rails log (i.e. development.log or staging.log or production.log).

## Authorization

The gem uses a controller to send messages to the server, in some cases you may need to authorize the controller actions for it to work correctly (otherwise you will get an authorization error). Below is a how-to guide for CanCan, but the same principles can be applied to other authorization gems.

### CanCan

1. Create a new controller `logger_controller.rb` that inherits from `RailsClientLoggersController` like this:

    ```ruby
    class LoggerController < RailsClientLogger::RailsClientLoggersController
      skip_authorization_check
    end
    ```

2. Add a new route in `routes.rb`

    ```ruby
    match 'logger/rails_client_logger/log' => 'logger#log', via: :post
    mount RailsClientLogger::Engine, :at => "logger"
    ```

## Namespaced Logger URL

In case you need more flexibility with the url handling, for example if you have an API only app.

1. Modify routes.rb to include namespaced API routes

```ruby
namespace :api do
  namespace :v1 do
    mount RailsClientLogger::Engine, :at => "apilogger"
  end
end
```

2. Specify global vars like

```javascript
window.jsLoggerBasePath = "/api/v1"
window.jsLoggerUrl = "/apilogger/rails_client_logger/log"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

[meghali](https://github.com/Meghali) - for the idea

[girishso](https://github.com/girishso) - for the implementation

[elthariel](https://github.com/elthariel) - for Rails 4 support and CoffeeScript
implementation

[rhino232](https://github.com/rhino232) - for namespaced URLs

## License
MIT License

Copyright (c) 2013 Girish Sonawane (girish dot sonawane at gmail dot com)
