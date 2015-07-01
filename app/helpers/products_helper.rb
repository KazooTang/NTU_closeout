module ProductsHelper
  def link_image_for(p)
    if p.attachments.empty?
      img = image_tag(p.full_picture || 'default.png', :class => 'img_p')
      return link_to(img, p.link)
    end
    img = p.attachments.first.full_picture
    url = product_path(p)
    link_to image_tag(img, :class => 'img_p'), url, :title => "Show Attachments"
  end

  def link_user_follow(p)
    link_to 'Unfollow', follow_path(p), method: :delete, remote: true, data: {id: p.id}, class: 'btn btn-info'

#    link_to 'Unfollow', follow_path(u.follows.where(product: p)[0].id), method: :delete, class: 'btn btn-warning', id: 'meow', remote: true #, data: { confirm: 'Are you sure?'}
  end

  def user_link(p)
    link_to p.seller_name, "https://www.facebook.com/#{p.seller_id}"
  end
end
