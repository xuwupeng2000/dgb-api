class SubOrder < ActiveRecord::Base
  belongs_to :order
  has_one :product

  validates_presence_of :order, message: 'suborder has to belong to order'
  validates_presence_of :ref
  validates_presence_of :quantity, message: 'please enter quantity'
  validates_numericality_of :quantity, only_integer: true, greater_than: 0, message: 'please enter quantity'
end
