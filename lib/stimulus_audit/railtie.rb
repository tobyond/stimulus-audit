# frozen_string_literal: true

module StimulusAudit
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/stimulus_audit.rake"
    end

    initializer "stimulus-audit.setup" do
      require "stimulus_audit"
    end
  end
end
