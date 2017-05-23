class BrandOwner < ApplicationRecord

has_many :products
has_many :orders
has_many :ratings

self.per_page = 3
end
