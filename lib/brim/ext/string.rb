require 'thor/util'

class String
  def underscore
    Thor::Util.snake_case self
  end

  def camelize
    Thor::Util.camel_case self
  end

  def humanize
    result = self.to_s.dup
    result.gsub!(%r/_/, ' ')
    result.gsub(%r/([a-z\d]*)/) { |match| match.downcase }
      .gsub(%r/^\w/) { $&.upcase }
  end

  def titleize
    self.underscore.humanize.gsub(%r/\b('?[a-z])/) { $1.capitalize }
  end
end
