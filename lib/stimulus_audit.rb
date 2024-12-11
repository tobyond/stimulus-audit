# frozen_string_literal: true

require "set"
require "pathname"
require "stimulus_audit/version"
require "stimulus_audit/configuration"
require "stimulus_audit/auditor"
require "stimulus_audit/scanner"

if defined?(Rails)
  require "rails"
  require "stimulus_audit/railtie"
end

module StimulusAudit
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def reset_configuration!
      @configuration = Configuration.new
    end

    def root
      if defined?(Rails)
        Rails.root
      else
        Pathname.new(Dir.pwd)
      end
    end
  end
end
