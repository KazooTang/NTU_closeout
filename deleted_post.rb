require "koala"

g = Koala::Facebook::API.new(IO.read('token'))

Product.last.id.downto(1) do |i|
  begin
    g.get_object(Product.find(i).pid)
  rescue
    p = Product.where(pid: Product.find(i).pid)
    p[0].message = '(DELETED)' + p[0].message if p[0].message && !p[0].message.include?('(DELETED)')
    p[0].save
    p p.pid
  end
end
