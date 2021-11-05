class Menuitem < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :cat, presence: true

  def self.category(catg)
    where("cat = ?", catg)
  end

  def self.category_list
    distinct.pluck(:cat)
  end
end
