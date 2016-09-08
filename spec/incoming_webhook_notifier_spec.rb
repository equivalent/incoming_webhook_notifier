require 'spec_helper'

describe IncomingWebhookNotifier do
  it 'has a version number' do
    expect(IncomingWebhookNotifier::VERSION).not_to be nil
  end

  describe '#slack_notify' do
    let(:slack_webhook_url) { 'https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX' }

    it "should send request to correct Slack webhook url with correct body and content type" do
      stub_request(:post, "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX").
        with(:body => "{\"text\":\"Bring Me The Horizon\",\"pretext\":\"Atreyu\",\"mrkdwn_in\":[\"Bring Me The Horizon\",\"Atreyu\"]}",
             :headers => {'Content-Type'=>'application/json'}).
        to_return(:status => 200, :body => "", :headers => {})

      described_class.slack_notify(slack_webhook_url, text: "Bring Me The Horizon", pretext: "Atreyu")
    end
  end

  describe '#airbrake_deploy' do
    let(:airbrake_webhook_url) { 'https://airbrake.io/api/v4/projects/1234projectid890/deploys?key=123projectkey890' }
    let(:expected_body) do
      %q{{"environment":"production","username":"Lizzy","repository":"https://github/pobble-dummy/halestorm","revision":"38748467ea579e7ae64f7815452307c9d05e05c5","version":"v2.0"}}
    end

    it "should send request to correct Airbrake webhook url with correct body and content type" do
      stub_request(:post, "https://airbrake.io/api/v4/projects/1234projectid890/deploys?key=123projectkey890").
        with(:body => expected_body,
             :headers => {'Content-Type'=>'application/json'}).
        to_return(:status => 200, :body => "", :headers => {})


      described_class.airbrake_deploy_notify(airbrake_webhook_url,
        environment: 'production',
        username: 'Lizzy',
        repository: 'https://github/pobble-dummy/halestorm',
        revision: git_commit_id = '38748467ea579e7ae64f7815452307c9d05e05c5',
        version: 'v2.0')
    end
  end
end
