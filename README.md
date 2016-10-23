# Incoming Webhook Notifier

[![Build Status](https://travis-ci.org/Pobble/incoming_webhook_notifier.svg?branch=master)](https://travis-ci.org/Pobble/incoming_webhook_notifier)
[![Open Thanks](https://thawing-falls-79026.herokuapp.com/images/thanks-1.svg)](https://thawing-falls-79026.herokuapp.com/r/dvsrzclb)

Simple Ruby lang Net/HTTPs implementation to send requests to "incomming webhooks" of providers:

* Slack https://api.slack.com/incoming-webhooks
* Airbrake https://airbrake.io/docs/airbrake-faq/deploy-tracking/

Why this gem ?

Because it's using just native Ruby lib to send the request, nothing
fancy therefore it can be used in Ruby scripts as well as Rails apps.

## Alternatives 

Don't like the idea of this gem ? Try this approaches:

* Slack - https://github.com/stevenosloan/slack-notifier
* Airbrake - https://github.com/airbrake/airbrake/wiki/Accessing-Rake-tasks-outside-a-Rails-app

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'incoming_webhook_notifier'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install incoming_webhook_notifier

## Usage

##### Slack Incoming Webhook

https://api.slack.com/incoming-webhooks

```ruby
require 'incoming_webhook_notifier'

IncomingWebhookNotifier.slack_notify('https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX', text: "Woo Hoo! Deployment was done")
```

##### Airbrake Deploy Tracking

https://airbrake.io/docs/airbrake-faq/deploy-tracking/

```ruby
require 'incoming_webhook_notifier'

git_commit_id = '38748467ea579e7ae64f7815452307c9d05e05c5'
# note: this can actually be branch name too, thx to Github API magic it works:
# git_commit_id = 'live-20160808_001'

options = {
  environment: 'production',
  username: 'danny',
  repository: 'https://github/dummy-organization/asking-alexandria',
  revision: git_commit_id,
  version: 'v2.0'
}

IncomingWebhookNotifier.airbrake_deploy_notify('https://airbrake.io/api/v4/projects/1234projectid890/deploys?key=123projectkey890', options)
```

##### Other Examples

check Wiki https://github.com/Pobble/incoming_webhook_notifier/wiki

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pobble/incoming_webhook_notifier. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

