require 'thor/util'

class String
  def underscore
    Thor::Util.snake_case self
  end

  def camelize
    Thor::Util.camel_case self
  end
end
