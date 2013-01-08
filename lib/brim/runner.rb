require 'thor/runner'

class Brim::Runner < ::Thor::Runner
  def method_missing name, *args
    name = name.to_s
    name.sub! /^brim:/, ''
    super name, *args
  end

  private

  def thorfiles *args
    Dir[File.expand_path('../tasks/**/*.rb', __FILE__)]
  end
end

