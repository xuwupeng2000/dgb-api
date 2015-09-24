class Customer < ActiveRecord::Base
  belongs_to :user
  has_many :orders, :dependent => :destroy

  validates_presence_of :name, message: 'please enter name'
  validates_presence_of :address, message: 'please enter address'
end
