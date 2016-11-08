class Monogram
  def initialize(user, template, options = {})
    @name = user.full_name
    @template = template
    @size = options.delete(:size) || :small
    @shape = options.delete(:shape) || :circle
    @options = options
  end

  FILLS = %w(fill-green fill-blue fill-purple fill-orange
             fill-red fill-turquoise fill-lighten0 fill-teal)

  def fill
    FILLS[hash.to_i % FILLS.size]
  end

  def initials
    @initials ||= @name.underscore
                       .split(/\s|_/)
                       .map { |s| s[0].upcase }
                       .join
                       .slice(0..1)
  end

  def size
    case @size
    when :small
      'graphic-sm'
    when :medium
      'graphic-md'
    when :large
      'graphic-lg'
    end
  end

  def shape
    case @shape
    when :circle
      'img-circle'
    when :square
      'img-rounded'
    end
  end

  def extra_classes
    @options[:class]
  end

  def to_s
    @template.render partial: 'shared/monogram', object: self
  end

  private

  def hash
    Digest::MD5.hexdigest(@name)
  end
end
