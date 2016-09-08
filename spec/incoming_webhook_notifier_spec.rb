require 'spec_helper'

describe IncomingWebhookNotifier do
  it 'has a version number' do
    expect(IncomingWebhookNotifier::VERSION).not_to be nil
  end

  describe '#notify_slack' do
    let(:slack_webhook_url) { 'https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX' }

    it "should send request to correct webhook url with correct body and content type" do
      stub_request(:post, "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX").
        with(:body => "{\"text\":\"Bring Me The Horizon\",\"pretext\":\"Atreyu\",\"mrkdwn_in\":[\"Bring Me The Horizon\",\"Atreyu\"]}",
             :headers => {'Content-Type'=>'application/json'}).
        to_return(:status => 200, :body => "", :headers => {})

      described_class.notify_slack(slack_webhook_url, text: "Bring Me The Horizon", pretext: "Atreyu")
    end
  end
end
