class Cart < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :price, prescence: true
  validates :qty, :numericality => { greater_than: 0 }
end
