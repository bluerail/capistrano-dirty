# Capistrano::Dirty

A little capistrano task for checking if a codebase is dirty, against a couple of patterns (e.g. FIXMEs, git conflict markers...).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-dirty'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-dirty


To expose the Capistrano task, add the following to your Capfile:

```ruby
require 'capistrano_dirty'
load 'capistrano_dirty/tasks.rake'
```

Finally, to fail deploys when something is found, you can do something like this in your Capfile:

```ruby
before 'deploy:check', 'capistrano_dirty:check'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bluerail/capistrano-dirty

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
