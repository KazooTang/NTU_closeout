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
    where.not([(['(p_name like ? OR message like ?)'] * 2).join(' OR ')] + ['%SOLD%', '%DELETED%'].map{|x| [x] * 2}.flatten).where.not(message: nil)
#    where.not('p_name like ? OR p_name like ? OR p_name like ?', '%SOLD%', '%已售出%', '%(DELETED)%').where.not(message: nil)
  end

  def self.sold
    where([(['(p_name like ? OR message like ?)'] * 2).join(' OR ')] + ['%SOLD%', '%DELETED%'].map{|x| [x] * 2}.flatten)
#    where('p_name like ? OR p_name like ? OR p_name like ?', '%SOLD%', '%已售出%', '%(DELETED)%')
  end

  def self.search(search)
    if search
      search_length = search.split.length
      where([(['(p_name like ? OR u_name like ?)'] * search_length).join(' AND ')] + search.split.map{|x| ["%#{x}%"] * 2}.flatten)
    else
      all
    end
  end
end
