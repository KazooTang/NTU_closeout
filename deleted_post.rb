require "koala"

g = Koala::Facebook::API.new(IO.read('token'))

Product.all[4841..-1].each do |x|
  p x.id
  begin
    g.get_object(x.pid)
  rescue
    p = Product.where(pid: x.pid)
    p[0].message = '(DELETED)' + p[0].message if p[0].message
    p[0].save
  end
end
