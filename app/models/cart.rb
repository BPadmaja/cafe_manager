class Cart < ApplicationRecord
  belongs_to :user
  has_many :menuitems
  validates :qty, :numericality => { greater_than: 0 }

  def self.find_item(id)
    find_by("menuitem_id = ?", id)
  end

  def self.calculate_total(id)
    where("user_id =?", id).sum(:price)
  end
end
