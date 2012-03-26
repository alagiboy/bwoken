require 'fileutils'

require 'bwoken/version'
require 'bwoken/simulator'
require 'bwoken/build'
require 'bwoken/script'
require 'bwoken/coffeescript'

module Bwoken
  class << self
    def app_name
      File.basename(project_path)
    end

    def app_dir
      File.join(build_path, "#{app_name}.app")
    end

    def project_path
      Dir.pwd
    end

    def path_to_automation
      '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Instruments/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate'
    end

    def build_path
      File.join(project_path, 'build').tap do |dir_name|
        FileUtils.mkdir_p(dir_name) unless Dir.exists?(dir_name)
      end
    end

    def workspace
      File.join(project_path, "#{app_name}.xcworkspace")
    end

    def results_path
      File.join(project_path, 'automation', 'results').tap do |dir_name|
        FileUtils.mkdir_p(dir_name) unless Dir.exists?(dir_name)
      end
    end

  end
end
