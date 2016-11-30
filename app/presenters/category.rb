class Category
  attr_reader :name

  def initialize(name, template)
    @name = name
    @template = template
  end

  def color
    case @name
    when 'agile'
      'fill-green'
    when 'developer_tools'
      'fill-turquoise'
    when 'design'
      'fill-purple'
    when 'front_end'
      'fill-blue'
    when 'database'
      'fill-red'
    when 'learning'
      'fill-yellow'
    when 'news'
      'fill-orange'
    when 'miscellaneous'
      'fill-light-blue'
    end
  end

  def to_s
    @template.render partial: 'shared/category', object: self
  end
end
