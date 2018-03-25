require 'spec_helper'

RSpec.describe Visionect::Client::Backend do
  let(:api_key) { "abc123" }
  let(:host) { "visionect.foo.com" }
  let(:client) { Visionect::Client.new(host: host, api_key: api_key, api_secret: "def456") }

  describe "#update_backend" do
    let(:uuid) { "ghi789" }

    before(:each) do
      stub_request(:put, "http://#{host}:8081/backend/#{uuid}").
        with(
          headers: {
            "Content-Type" => /multipart/,
            "Authorization" => /#{api_key}/
          }
        ).
        to_return(status: 200)
    end

    subject { client.update_backend(uuids: [uuid], binary_png: "pngbinarydata") }

    it "requests the expected PUT" do
      expect(subject.code).to eq("200")
    end
  end
end
