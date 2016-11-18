module MeetingsHelper

  def additional_speakers(meeting, limit)
    css = 'speaker inline fill-lighten0 dark img-circle center small strong'
    remaining = meeting.talks.count - limit
    content_tag(:div, "+#{remaining}", class: css) if remaining > 0
  end
end
