require "koala"

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
    begin
      p.picture = g.get_object("#{p.pid}?fields=full_picture")['full_picture'] || x['picture']
    rescue
      p.picture = x['picture']
    end
    p.link = 'https://www.facebook.com/' + gid + '/posts/' + p.pid[/_(.*)/, 1]
    p.created_time = Time.parse(x['created_time'])
    p.updated_time = Time.parse(x['updated_time'])
    p.save if !(p.message.nil? && p.picture.nil?)
    
    begin
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
    rescue
      p p.pid
    end
    p p.pid
  end
  break if d.last['updated_time'] < Time.now - ARGV[0].to_i.minutes
  d = d.next_page
end
