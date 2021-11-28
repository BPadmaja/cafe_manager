class Menuitem < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :cat, presence: true

  def self.category(catg)
    where("cat = ?", catg)
  end

  def self.category_list
    distinct.pluck(:cat)
  end

  def self.increment
    self.qty += 1
  end
end
