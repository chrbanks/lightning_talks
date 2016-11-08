module AvatarHelper

  def monogram_for(name, options = {})
    presenter = Monogram.new(name, self, options)
    if block_given?
      yield presenter
    else
      presenter
    end
  end
end
