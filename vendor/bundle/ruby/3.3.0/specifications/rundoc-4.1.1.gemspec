# -*- encoding: utf-8 -*-
# stub: rundoc 4.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rundoc".freeze
  s.version = "4.1.1".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Richard Schneeman".freeze]
  s.date = "2024-12-13"
  s.description = "RunDOC turns docs to runable code".freeze
  s.email = ["richard.schneeman+rubygems@gmail.com".freeze]
  s.executables = ["rundoc".freeze]
  s.files = ["bin/rundoc".freeze]
  s.homepage = "https://github.com/schneems/rundoc".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.5.23".freeze
  s.summary = "RunDOC generates runable code from docs".freeze

  s.installed_by_version = "3.5.22".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<thor>.freeze, [">= 0".freeze])
  s.add_runtime_dependency(%q<parslet>.freeze, ["~> 2".freeze])
  s.add_runtime_dependency(%q<capybara>.freeze, ["~> 3".freeze])
  s.add_runtime_dependency(%q<selenium-webdriver>.freeze, ["~> 4".freeze])
  s.add_runtime_dependency(%q<base64>.freeze, ["~> 0".freeze])
  s.add_runtime_dependency(%q<aws-sdk-s3>.freeze, ["~> 1".freeze])
  s.add_runtime_dependency(%q<dotenv>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<mocha>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<minitest>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<standard>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0".freeze])
end
