require "koala"

g = Koala::Facebook::API.new(IO.read('token'))

gid = '400948843346851'
d = g.get_connection(gid, 'feed')

while d
  d.each do |x|
    p = Product.find_by(product_id: x['id']) || Product.new
    p.product_id = x['id']
    p.seller_id = x['from']['id']
    p.seller_name = x['from']['name']
    begin
      m = x['message'].split("\n")
      p.product_name = m[0]
      p.price = m[1][/(.*) -/, 1]
      p.place = m[1][/(.*) - (.*)/, 2]
      p.message = m[3..-1].join("\n")
    rescue
      p.message = x['message']
    end
    begin
      p.full_picture = g.get_object("#{p.product_id}?fields=full_picture")['full_picture'] || x['picture']
    rescue
      p.full_picture = x['picture']
    end
    p.picture = x['picture']
    p.link = 'https://www.facebook.com/' + gid + '/posts/' + p.product_id[/_(.*)/, 1]
    p.created_time = Time.parse(x['created_time'])
    p.updated_time = Time.parse(x['updated_time'])
    p.save if !(p.message.nil? && p.picture.nil?)
    
    begin
      dd = g.get_object("#{p.product_id}?fields=attachments")
      dd['attachments']['data'][0]['subattachments']['data'].each do |y|
        a = Attachment.find_by(attachment_id: y['target']['id']) || Attachment.new
        a.message = y['description']
        a.full_picture = y['media']['image']['src']
        a.attachment_id = y['target']['id']
        a.link = y['target']['url']
        a.product = p
        a.save
      end
    rescue => error
    end
    p p.product_id
  end
  #break if d.last['updated_time'] < Time.now - ARGV[0].to_i.days
  d = d.next_page
end
