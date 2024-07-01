class Store < ApplicationRecord
    belongs_to :user
    has_many :products, dependent: :destroy

    validates :name, :location, :rating, presence: true

    def dealer?
        role == 'dealer'
    end

    def admin?
        role == 'admin'
    end
end
