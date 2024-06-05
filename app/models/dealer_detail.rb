class DealerDetail < ApplicationRecord
    belongs_to :user
    has_many :products, dependent: :destroy

    validates :name, :location, :rating, presence: true
end
