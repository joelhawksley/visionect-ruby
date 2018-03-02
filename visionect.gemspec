
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "visionect/version"

Gem::Specification.new do |spec|
  spec.name          = "visionect"
  spec.version       = Visionect::VERSION
  spec.authors       = ["Joel Hawksley"]
  spec.email         = ["joel@hawksley.org"]

  spec.summary       = %q{Client library for the Visionect Server Management API}
  spec.description   = %q{Client library for the Visionect Server Management API}
  spec.homepage      = "https://github.com/joelhawksley/visionect"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "multipart-post"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
