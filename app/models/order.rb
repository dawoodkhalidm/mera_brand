class Order < ApplicationRecord

belongs_to :brand_owner
belongs_to :customer
belongs_to :product
end
