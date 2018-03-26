class Product < ApplicationRecord
	belongs_to :category
	has_attached_file :image, styles: {large: "600x600>", medium: "75x75>", thumb:"150x150>"}
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    resourcify
    has_many :order_items
end
