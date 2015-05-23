class Product < ActiveRecord::Base
  def self.updated
    where('updated_time > ?', Time.now - 10.days).order('updated_time desc')
  end

  def self.created
    where('created_time > ?', Time.now - 10.days).order('created_time desc')
  end

end
