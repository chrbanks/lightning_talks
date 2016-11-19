module TalksHelper

  def category_link_for(talk)
    presenter = CategoryLink.new(talk.category, self)
    if block_given?
      yield presenter
    else
      presenter
    end
  end

  def next_talk(talk)
    link_to meeting_talk_path(talk.meeting, talk.next), class: 'btn btn-default next-talk pin-right hidden-xs lift' do
      content_tag :i, nil, class: 'icon icon-arrow-right'
    end if talk.next
  end

  def previous_talk(talk)
    link_to meeting_talk_path(talk.meeting, talk.previous), class: 'btn btn-default next-talk pin-left hidden-xs lift' do
      content_tag :i, nil, class: 'icon icon-arrow-left'
    end if talk.previous
  end
end
