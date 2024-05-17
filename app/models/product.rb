class Product < ApplicationRecord
    has_many :reviews
    validates :title, presence: true
    validates :description, presence: true
end
