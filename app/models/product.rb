class Product < ApplicationRecord

belongs_to :brand_owner
has_many :orders

has_attached_file :image, styles: { medium: "700x300>", thumb: "700x300>" }, default_url: "/images/:style/missing.png"
validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

 

def self.search(search)
  self.joins(:brand_owner).where("product_name LIKE ? OR product_type LIKE ?","%#{search}%", "%#{search}%").order("brand_owners.rating DESC")
end

end
