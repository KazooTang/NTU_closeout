module ProductsHelper
  def product_image(p)
    if p.attachments.empty?
      p.picture
    else
      p.attachments.first.image_src
    end
  end
end
