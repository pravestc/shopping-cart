class Item < ActiveRecord::Base
  has_many :manifests
  has_many :carts, :through => :manifests
  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

  translates :name, :legend, :effect, :stats
  globalize_accessors :locales => [:en, :es], :attributes => [:name, :legend, :effect, :stats]

  def price_dollars
    self.price / 100
  end

  def price_dollars=(val)
    self.price = val * 100
  end
end
