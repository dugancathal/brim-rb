require "brim/version"
require 'brim/runner'

require 'brim/ext/string'
require 'pathname'

module Brim
  def self.project_name
    @project_name ||= File.basename(Pathname.pwd.ascend do |path|
      break(path) if File.exists?(path.join('Gemfile'))
    end)
  end
end

