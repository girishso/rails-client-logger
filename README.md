# What is that for?

Rails engine to log from Client side (Browser) javascript to server log file. To catch those nasty production Javascript errors. Provides a variety of safe logging functions e.g. jsLogger.debug(), jsLogger.error().

There are 5 levels of logging: debug, info, warn, error and fatal.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails-client-logger'
```
    
And then execute:

```bash
$ bundle
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
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

[meghali](https://github.com/Meghali) - for the idea

[girishso](https://github.com/girishso) - for the implementation

## License
MIT License

Copyright (c) 2013 Girish Sonawane (girish dot sonawane at gmail dot com)

