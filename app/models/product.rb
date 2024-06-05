class Product < ApplicationRecord
    belongs_to :dealer_detail
    has_many :reviews
    validates :title, :description, :price, :image_url, presence: true
end
