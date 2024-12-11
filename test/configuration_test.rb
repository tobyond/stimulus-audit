# frozen_string_literal: true

require "test_helper"

class ConfigurationTest < StimulusAuditTest
  def test_default_configuration
    config = StimulusAudit::Configuration.new
    assert_kind_of Array, config.view_paths
    assert_kind_of Array, config.controller_paths
  end

  def test_custom_configuration
    custom_paths = ["custom/views"]
    custom_controller_paths = ["custom/controllers"]

    StimulusAudit.configure do |config|
      config.view_paths = custom_paths
      config.controller_paths = custom_controller_paths
    end

    assert_equal custom_paths, StimulusAudit.configuration.view_paths
    assert_equal custom_controller_paths, StimulusAudit.configuration.controller_paths
  end
end
