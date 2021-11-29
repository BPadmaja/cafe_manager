class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def self.user_email

  end
end

class OrderItem < ActiveRecord::Base
  belongs_to :order
end
