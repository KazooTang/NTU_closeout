module ProductsHelper
  def link_image_for(p)
    return image_tag(p.picture || 'default.png', :class => 'img_p_list') if p.attachments.empty?
    img = p.attachments.first.image_src
    url = product_path(p)
    link_to image_tag(img, :class => 'img_p_list'), url, :title => "Show Attachments"
  end

  def product_image(p)
    if p.attachments.empty?
      p.picture
    else
      p.attachments.first.image_src
    end
  end
end
