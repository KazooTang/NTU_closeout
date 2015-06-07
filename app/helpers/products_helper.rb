module ProductsHelper
  def link_image_for(p)
    if p.attachments.empty?
      img = image_tag(p.picture || 'default.png', :class => 'img_p')
      return p.link ? link_to(img, p.link) : img
    end
    img = p.attachments.first.image_src
    url = product_path(p)
    link_to image_tag(img, :class => 'img_p'), url, :title => "Show Attachments"
  end

  def link_user_follow(u, p)
    if u.follows.where(product_id: p).empty?
      link_to image_tag('add-01.png'), follows_path(p), method: :post
    else
      link_to image_tag('add-02.png'), follow_path(u.follows.where(product: p)[0].id), method: :delete#, data: { confirm: 'Are you sure?'}
    end
  end
end
