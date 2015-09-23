class User < ActiveRecord::Base
  has_many :customers
  has_many :product_users, :dependent => :destroy
  has_and_belongs_to_many :products, :through => :product_users
  has_many :orders, :dependent => :destroy
  has_many :deliverables, :through => :orders
end
