require_relative 'lib/premier_league_explorer'

Gem::Specification.new do |spec|
  spec.name          = "premier_league_explorer"
  spec.version       = "0.1.0"
  spec.authors       = ["antdp425"]
  spec.email         = ["antdp425@aol.com"]

  spec.summary       = "A CLI app that allows you to quickly check info about teams in the English Premier League"
  spec.homepage      = "https://github.com/antdp425/premier_league_explorer"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/antdp425/premier_league_explorer"
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
