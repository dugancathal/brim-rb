require 'erb'

module Brim
  class Migrations < ::Thor
    include Thor::Actions
    namespace :migrations
  
    desc "#{namespace}:create_table NAME", "Create an ActiveRecord Migration for creating a table"
    def create_table name
      @model_name = name.underscore
      template 'migrations/create_table.erb', "db/migrate/#{filetime}_create_#{@model_name}.rb"
    end
  
    private
  
    def self.source_root
      File.expand_path('../../templates', __FILE__)
    end
  
    def filetime
      Time.now.strftime('%Y%m%d%H%M%S')
    end
  end
end
