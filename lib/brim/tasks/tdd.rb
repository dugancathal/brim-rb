require 'erb'

module Brim
  class TDD < ::Thor
    include Thor::Actions
    namespace :tdd
  
    desc "#{namespace}:rspec CLASSNAME", "Create an RSpec test file for CLASSNAME"
    def rspec name
      tdd_template 'rspec', name
    end
  
    desc "#{namespace}:minitest CLASSNAME", "Create an MiniTest test file for CLASSNAME"
    def rspec name
      tdd_template 'minitest', name
    end

    private
  
    def tdd_template framework, class_name
      @class_name = class_name.underscore
      template "tdd/#{framework}.erb", "test/#{::Brim.project_name}/#{@class_name}.rb"
    end

    def self.source_root
      File.expand_path('../../templates', __FILE__)
    end
  
    def filetime
      Time.now.strftime('%Y%m%d%H%M%S')
    end
  end
end
