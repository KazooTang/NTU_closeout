require "koala"
require "awesome_print"

g = Koala::Facebook::API.new(IO.read('token'))

Product.last.id.downto(1) do |i|
  begin
    g.get_object(Product.find(i).pid)
  rescue
    begin
      p = Product.find(i)
      ap p.message
      p.message = '(DELETED)' + p.message if p.message && !p.message.include?('(DELETED)')
      p.save
    rescue => error
    end
  end
end
