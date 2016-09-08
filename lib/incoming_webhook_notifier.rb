require "incoming_webhook_notifier/version"
require "incoming_webhook_notifier/post_https"

module IncomingWebhookNotifier
  def self.slack_notify(slack_webhook_endpoint, text:, pretext: nil )
    body_hash = {
      text: text,
      pretext: pretext,
      mrkdwn_in: [
        text,
        pretext
      ]
    }

    PostHTTPS.call(slack_webhook_endpoint, body_hash)
  end

  def self.airbrake_deploy_notify(airbrake_webhook_endpoint,
                                  environment:,
                                  username:,
                                  repository:,
                                  revision:,
                                  version:)

    body_hash = {
      "environment": environment,
      "username": username,
      "repository": repository,
      "revision": revision,
      "version": version
    }

    PostHTTPS.call(airbrake_webhook_endpoint, body_hash)
  end
end
