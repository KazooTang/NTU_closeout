module ProductsHelper
  def link_image_for(p)
    if p.attachments.empty?
      img = image_tag(p.picture || 'default.png', :class => 'img_p_list')
      return p.link ? link_to(img, p.link) : img
    end
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
