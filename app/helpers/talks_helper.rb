module TalksHelper

  def category_for(talk)
    presenter = Category.new(talk.category, self)
    if block_given?
      yield presenter
    else
      presenter
    end
  end

  def next_talk(talk)
    link_to talk.next, class: 'btn btn-default next-talk pin-right hidden-xs lift' do
      content_tag :i, nil, class: 'icon icon-arrow-right'
    end if talk.next
  end

  def previous_talk(talk)
    link_to talk.previous, class: 'btn btn-default next-talk pin-left hidden-xs lift' do
      content_tag :i, nil, class: 'icon icon-arrow-left'
    end if talk.previous
  end

  def favorite_icon(talk)
    color = current_user.favorite?(talk) ? 'danger' : 'quiet'
    content_tag :i, nil, class: "icon icon-heart icon-md #{color}"
  end  
end
