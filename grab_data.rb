require "Koala"
require "Time"

g = Koala::Facebook::API.new(IO.read('token'))

gid = '400948843346851'
d = g.get_connection(gid, 'feed')

while d
  d.each do |x|
    p = Product.find_by(pid: x['id']) || Product.new
    p.pid = x['id']
    p.uid = x['from']['id']
    p.name = x['from']['name']
    p.message = x['message']
    p.picture = x['picture']
    p.link = x['link']
    p.created_time = Time.parse(x['created_time'])
    p.updated_time = Time.parse(x['updated_time'])
    p.save
    
    dd = g.get_object("#{p.pid}?fields=attachments")
    next if !dd.include?('attachments') || !dd['attachments']['data'].first.include?('subattachments')
    dd['attachments']['data'].first['subattachments']['data'].each do |y|
      a = Attachment.find_by(oid: y['target']['id']) || Attachment.new
      a.image_src = y['media']['image']['src']
      a.oid = y['target']['id']
      a.ourl = y['target']['url']
      a.product = p
      a.save
    end
  end
  break if d.last['updated_time'] < Time.now - 1.minute
  d = d.next_page
end