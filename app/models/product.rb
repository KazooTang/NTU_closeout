class Product < ActiveRecord::Base
  has_many :attachments

  def self.updated
    order('updated_time desc')
  end

  def self.created
    order('created_time desc')
  end

  def self.selling
    where.not('message like ? OR message like ?', '%SOLD%', '%已售出%')
  end

  def self.sold
    where('message like ? OR message like ?', '%SOLD%', '%已售出%')
  end

  def self.search(search)
    if search
      where('message like ?', "%#{search}%")
    else
      all
    end
  end
end
