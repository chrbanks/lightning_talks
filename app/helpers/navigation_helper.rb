module NavigationHelper

  def nav_tab(title, url, options = {}, &block)
    current = options.delete(:current)
    options[:class] ||= ''
    options[:class] << ' tab-link keyline-bottom hidden-xs quiet pad1y inline'
    options[:class] << ' active' if current == title
    options[:href] = url
    content_tag :a, title, options, &block
  end

  def currently_at(tab)
    render partial: 'application/navigation', locals: { current: tab }
  end

  def tab_link(title, url, options = {}, &block)
    options[:class] ||= ''
    options[:class] << ' tab-link keyline-bottom quiet pad1y inline'
    options[:class] << ' active' if request.path == url
    options[:href] = url
    content_tag :a, title, options, &block
  end
end
