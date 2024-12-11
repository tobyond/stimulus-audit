# frozen_string_literal: true

namespace :stimulus do
  desc "Audit Stimulus controllers usage and find orphaned controllers"
  task audit: :environment do
    StimulusAudit::Auditor.new.audit.to_console
  end

  desc "Scan files for stimulus controller usage (e.g., rake stimulus:scan[users--name])"
  task :scan, [:controller] => :environment do |_, args|
    controller = args[:controller]
    if controller.nil? || controller.empty?
      puts "Please provide a controller name: rake stimulus:scan[controller_name]"
      next
    end

    StimulusAudit::Scanner.new.scan(controller)
  end
end
