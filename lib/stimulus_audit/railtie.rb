# frozen_string_literal: true

module StimulusAudit
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/stimulus_audit.rake"
    end
  end
end
