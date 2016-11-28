module UsersHelper

  def speaker_badge(user)
    if user.speaker?
      content_tag :span, 'speaker',
                  class: 'badge fill-lighten0 dark small pad1x round inline'
    end
  end
end
