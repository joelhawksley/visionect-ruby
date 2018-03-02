require 'spec_helper'

RSpec.describe Visionect::Client do
  describe "#new" do
    subject { described_class.new(args) }

    context "when passed a host, port, and api credentials" do
      let(:args) { { host: "host", port: "1234", api_key: "api_key", api_secret: "api_secret" } }

      it "exposes the host, port, and api credentials" do
        expect(subject.host).to eq("host")
        expect(subject.port).to eq("1234")
        expect(subject.api_key).to eq("api_key")
        expect(subject.api_secret).to eq("api_secret")
      end
    end

    context "when no port is passed" do
      let(:args) { { host: "host", api_key: "api_key", api_secret: "api_secret" } }

      it "defaults to 8081" do
        expect(subject.port).to eq("8081")
      end
    end

    context "when no configuration is passed" do
      let(:args) { {} }

      context "when the client is configured with environment variables" do
        before do
          ENV["VISIONECT_HOST"] = "host"
          ENV["VISIONECT_PORT"] = "1234"
          ENV["VISIONECT_API_KEY"] = "api_key"
          ENV["VISIONECT_API_SECRET"] = "api_secret"
        end

        it "reads the configuration from the environment" do
          expect(subject.host).to eq("host")
          expect(subject.port).to eq("1234")
          expect(subject.api_key).to eq("api_key")
          expect(subject.api_secret).to eq("api_secret")
        end
      end
    end
  end
end
