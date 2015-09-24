class Product < ActiveRecord::Base
  validates :purchasing_price, numericality: { greater_than: 0, message: 'need to be greater than 0' }
  validates :selling_price, numericality: { greater_than: 0, message: 'need to be greater than 0' }
  validates_presence_of :name, message: 'please enter name'
  validates_presence_of :purchasing_price, message: 'please enter purchasing price'
  validates_presence_of :selling_price, message: 'please enter selling price'
end
