class Product < ApplicationRecord
    belongs_to :dealer_detail
    has_many :reviews
    validates :title, presence: true
    validates :description, presence: true
end
