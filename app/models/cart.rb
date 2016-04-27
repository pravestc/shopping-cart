class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :manifests
  has_many :items, :through => :manifests
  
  def totalprice_dollars
    self.totalprice / 100
  end

  def totalprice_dollars=(val)
    self.totalprice = val * 100
  end
end
