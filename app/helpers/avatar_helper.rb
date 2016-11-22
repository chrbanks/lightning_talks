module AvatarHelper

  def avatar_for(user, options = {})
    image_tag user.gravatar_url, options.merge(alt: user.full_name)
  end
end
