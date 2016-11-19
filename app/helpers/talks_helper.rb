module TalksHelper

  def category_link_for(talk)
    presenter = CategoryLink.new(talk.category, self)
    if block_given?
      yield presenter
    else
      presenter
    end
  end
end
