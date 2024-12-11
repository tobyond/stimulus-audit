# frozen_string_literal: true

require "set"
require "pathname"
require_relative "stimulus_audit/version"
require_relative "stimulus_audit/configuration"
require_relative "stimulus_audit/auditor"
require_relative "stimulus_audit/scanner"

if defined?(Rails)
  require "rails"
  require 'stimulus_audit'
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
