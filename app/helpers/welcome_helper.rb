module WelcomeHelper
  def user_image(user)
    image_tag(user.image || 'user_default.png', :alt => 'user icon', :class => 'user-img circular-image')
  end
end
