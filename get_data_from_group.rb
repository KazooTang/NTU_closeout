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
  end
  break if d.last['updated_time'] < Time.now - 1.day
  d = d.next_page
end
