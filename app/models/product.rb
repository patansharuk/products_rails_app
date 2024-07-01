class Product < ApplicationRecord
    belongs_to :store
    has_many :reviews
    validates :title, :description, :price, :image_url, presence: true
end
