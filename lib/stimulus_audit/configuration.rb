# frozen_string_literal: true

module StimulusAudit
  class Configuration
    attr_accessor :view_paths, :controller_paths

    def initialize
      reset
    end

    def reset
      base_path = StimulusAudit.root

      @view_paths = [
        base_path.join("app/views/**/*.{html,erb,haml}").to_s,
        base_path.join("app/javascript/**/*.{js,jsx}").to_s,
        base_path.join("app/components/**/*.{html,erb,haml,rb}").to_s
      ]

      @controller_paths = [
        base_path.join("app/javascript/controllers/**/*.{js,ts}").to_s
      ]
    end
  end
end
