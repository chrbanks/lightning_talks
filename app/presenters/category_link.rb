class CategoryLink
  attr_reader :category

  def initialize(category, template)
    @category = category
    @template = template
  end

  def color
    case @category
    when 'mobile'
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
    end
  end

  def to_s
    @template.render partial: 'shared/category_link', object: self
  end
end
