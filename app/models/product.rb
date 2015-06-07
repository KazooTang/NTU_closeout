class Product < ActiveRecord::Base
  has_many :attachments, dependent: :destroy
  has_many :follows, dependent: :destroy

  def self.updated
    order('updated_time desc')
  end

  def self.created
    order('created_time desc')
  end

  def self.selling
    where.not('message like ? OR message like ? OR message like ?', '%SOLD%', '%已售出%', '%(DELETED)%').where.not(message: nil)
  end

  def self.sold
    where('message like ? OR message like ? OR message like ?', '%SOLD%', '%已售出%', '%(DELETED)%')
  end

  def self.search(search)
    if search
      where('message like ? OR name like ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
