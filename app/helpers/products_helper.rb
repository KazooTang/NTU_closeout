module ProductsHelper
  def image_for(p)
    img = if p.attachments.empty?
            p.picture || 'default.png'
          else
            p.attachments.first.image_src
          end
    image_tag(img, :class => 'img_p')
  end

  def product_image(p)
    if p.attachments.empty?
      p.picture
    else
      p.attachments.first.image_src
    end
  end
end
