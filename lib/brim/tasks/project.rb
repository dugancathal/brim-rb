require 'erb'

module Brim
  class Project < ::Thor
    include Thor::Actions
    namespace :project
  
    desc "#{namespace}:new NAME", "Create a new Brim project"
    method_option 'test-framework', aliases: '-t', default: 'test'
    def new name_or_path
      @name = File.basename(name_or_path.underscore)
      @path = Pathname.new name_or_path
      @framework = options[:"test-framework"].underscore
      template 'project/README.md', @path.join('README.md')
      template 'project/LICENSE',   @path.join('LICENSE')
      template "project/#{@framework}_helper.rb.erb", @path.join(@framework, "#{@framework}_helper.rb")
      empty_directory @path.join(@framework, @name)

      template 'project/toplib.erb',     @path.join('lib', @name+'.rb')
      template 'project/version.rb.erb', @path.join('lib', @name, 'version.rb')
    end
  
    private
  
    def self.source_root
      File.expand_path('../../templates', __FILE__)
    end
  end
end
