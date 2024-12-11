# frozen_string_literal: true

require_relative "lib/stimulus_audit/version"

Gem::Specification.new do |spec|
  spec.name = "stimulus-audit"
  spec.version = StimulusAudit::VERSION
  spec.authors = ["Toby"]
  spec.email = ["toby@darkroom.tech"]

  spec.summary = "Audit Stimulus.js controllers in your Rails application"
  spec.description = "A Ruby gem to analyze usage of Stimulus controllers, finding unused controllers and undefined controllers"
  spec.homepage = "https://github.com/yourusername/stimulus-audit"
  spec.license = "MIT"
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 3.3.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
