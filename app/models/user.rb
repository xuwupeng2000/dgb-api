class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :customers
  has_many :product_users, :dependent => :destroy
  has_and_belongs_to_many :products, :through => :product_users
  has_many :orders, :dependent => :destroy
  has_many :deliverables, :through => :orders
end
