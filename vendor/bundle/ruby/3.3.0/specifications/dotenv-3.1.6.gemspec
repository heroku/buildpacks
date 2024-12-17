# -*- encoding: utf-8 -*-
# stub: dotenv 3.1.6 ruby lib

Gem::Specification.new do |s|
  s.name = "dotenv".freeze
  s.version = "3.1.6".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/bkeepers/dotenv/releases" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Brandon Keepers".freeze]
  s.date = "2024-12-13"
  s.description = "Loads environment variables from `.env`.".freeze
  s.email = ["brandon@opensoul.org".freeze]
  s.executables = ["dotenv".freeze]
  s.files = ["bin/dotenv".freeze]
  s.homepage = "https://github.com/bkeepers/dotenv".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "Loads environment variables from `.env`.".freeze

  s.installed_by_version = "3.5.22".freeze

  s.specification_version = 4

  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<standard>.freeze, [">= 0".freeze])
end
