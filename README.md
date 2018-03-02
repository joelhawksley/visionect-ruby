### visionect-ruby

Client library for the Visionect Server Management API

#### Installation

Add this line to your application's Gemfile:

```ruby
gem 'visionect', git: 'https://github.com/joelhawksley/visionect.git'
```

#### Usage

First, initialize and configure the client:

```ruby
client = Visionect::Client.new(
  host: 'visionect.myhost.com',
  port: (optional, defaults to 8081),
  api_key: 'my_api_key',
  api_secret: 'my_api_secret'
)
```

(or, set `VISIONECT_HOST`, `VISIONECT_PORT` (optional), `VISIONECT_API_KEY`, and `VISIONECT_API_SECRET` in your environment)

And then make a request:

```ruby
client.update_backend(uuids: [abc123]...)
```

#### Resources

##### Backend

###### update_backend(uuids:, binary_png:)

Updates the provided device UUIDs with the given binary PNG image.

#### Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/joelhawksley/visionect.
