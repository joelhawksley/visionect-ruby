module Visionect
  class Client
    module Device
      def get_device(uuid:)
        date = Time.new.httpdate
        path = "/api/device/#{uuid}"
        string = "GET\n\napplication/json\n#{date}\n#{path}"
        auth_value = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), api_secret, string)).strip()

        req = Net::HTTP::Get.new(path, {
          "Date" => date,
          "Authorization" => "#{api_key}:#{auth_value}",
          "Content-Type" => "application/json"
        })

        http = Net::HTTP.new(host, port)
        http.request(req)
      end
    end
  end
end
