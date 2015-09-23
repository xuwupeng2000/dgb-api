class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
  has_one :deliverable
  has_many :products :through => :sub_orders
  has_many :sub_orders, :dependent => :destroy

  def total_value
    
  end
end
