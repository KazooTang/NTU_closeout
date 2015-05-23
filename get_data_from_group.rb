require "Koala"

g = Koala::Facebook::API.new(IO.read('token'))

gid = '400948843346851'
d = g.get_connection(gid, 'feed')

while d
  d.each do |x|
    p = Product.find_by(pid: x['id']) || Product.new
    p.pid = x['id']
    p.uid, p.name = x['from']
    p.message = x['message']
    p.picture = x['picture']
    p.link = x['link']
    p.save
  end
  d = d.next_page
end
