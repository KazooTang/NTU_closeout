module ProductsHelper
  def link_image_for(p)
    if p.attachments.empty?
      img = image_tag(p.picture || 'default.png', :class => 'img_p')
      return link_to(img, p.link)
    end
    img = p.attachments.first.picture
    url = product_path(p)
    link_to image_tag(img, :class => 'img_p'), url, :title => "Show Attachments"
  end

  def link_user_follow(u, p)
    if u.follows.where(product_id: p).empty?
      link_to 'Follow', follows_path(p), method: :post, class: 'btn btn-primary', turbolinks: true
    else
      link_to 'Unfollow', follow_path(u.follows.where(product: p)[0].id), method: :delete, class: 'btn btn-warning'#, data: { confirm: 'Are you sure?'}
    end
  end

  def sqr_link_image_for(x)
    link_to image_tag(x.picture, class: 'sqr-img'), x.link
  end
end
