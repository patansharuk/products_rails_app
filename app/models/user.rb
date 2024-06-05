class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  after_initialize do
    if self.new_record?
      self.is_active = true
      self.role ||= :customer
    end
  end

  enum role: [:admin, :dealer, :customer]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  has_one :store, dependent: :destroy
  validates :role, :name, presence: true
end
