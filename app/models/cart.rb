class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :manifests
  has_many :items, :through => :manifests
end
