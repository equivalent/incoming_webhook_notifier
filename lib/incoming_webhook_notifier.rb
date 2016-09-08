require "incoming_webhook_notifier/version"
require "incoming_webhook_notifier/post_https"

module IncomingWebhookNotifier
  def self.notify_slack(slack_webhook_endpoint, text:, pretext: nil )
    options = {
      text: text,
      pretext: pretext,
      mrkdwn_in: [
        text,
        pretext
      ]
    }

    PostHTTPS.call(slack_webhook_endpoint, options)
  end
end
