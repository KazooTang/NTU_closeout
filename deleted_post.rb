require "koala"
require "awesome_print"

g = Koala::Facebook::API.new(IO.read('token'))

def add_deleted (s)
  '(DELETED)' + s if s && !s.include?('(DELETED)')
end

Product.last.id.downto(1) do |i|
  begin
    g.get_object(Product.find(i).product_id)
    ap i
  rescue
    begin
      p = Product.find(i)
      if p.product_name.nil?
        p.message = add_deleted(p.message)
      else
        p.product_name = add_deleted(p.product_name)
      end
      ap p.message
      p.save
    rescue => error
    end
  end
end
