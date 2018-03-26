require 'spec_helper'

RSpec.describe Visionect::Client::Device do
  let(:api_key) { "abc123" }
  let(:host) { "visionect.foo.com" }
  let(:client) { Visionect::Client.new(host: host, api_key: api_key, api_secret: "def456") }

  describe "#get_device" do
    let(:uuid) { "ghi789" }

    before(:each) do
      stub_request(:get, "http://#{host}:8081/api/device/#{uuid}").
        with(
          headers: {
            "Authorization" => /#{api_key}/
          }
        ).
        to_return(status: 200)
    end

    subject { client.get_device(uuid: uuid) }

    it "requests the expected GET" do
      expect(subject.code).to eq("200")
    end
  end
end
