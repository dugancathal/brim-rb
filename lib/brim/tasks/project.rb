require 'erb'

module Brim
  class Project < ::Thor
    include Thor::Actions
    namespace :project
  
    desc "#{namespace}:new NAME", "Create a new Brim project"
    method_option 'test-framework', aliases: '-t', default: 'test'
    def new name
      @name = name.underscore
      @framework = options[:"test-framework"].underscore
      inside @name do
        template 'doc/README.md', 'README.md'
        template 'doc/LICENSE',   'LICENSE'

        inside @framework do
          template "project/#{@framework}_helper.rb"
          empty_directory @name
        end

        inside 'lib' do
          template 'project/toplib.erb', "#{@name}.rb"
          inside @name do
            template 'project/version.rb.erb', 'version.rb'
          end
        end
      end
    end
  
    private
  
    def self.source_root
      File.expand_path('../../templates', __FILE__)
    end
  end
end
