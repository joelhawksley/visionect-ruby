require 'net/http/post/multipart'

module Visionect
  class Client
    module Backends
      def update_backend(uuids:, binary_png:)
        boundary = "#{rand(10000000000000000000)}"
        date = Time.new.httpdate
        path = "/backend/#{uuids.join(",")}"
        string = "PUT\n\nmultipart/form-data; boundary=#{boundary}\n#{date}\n#{path}"
        auth_value = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), api_secret, string)).strip()

        StringIO.open(binary_png) do |png|
          req = Net::HTTP::Put::Multipart.new(
            path,
            { image: UploadIO.new(png, "image/png", "image.png") },
            { "Date" => date, "Authorization" => "#{api_key}:#{auth_value}" },
            boundary
          )
          http = Net::HTTP.new(host, port)
          http.request(req)
        end
      end
    end
  end
end
