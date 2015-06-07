require "koala"

g = Koala::Facebook::API.new(IO.read('token'))

Product.all.each do |x|
  begin
    g.get_object(x.pid)
  rescue
    p = Product.where(pid: x.pid)
    p p[0].destroy
  end
end
