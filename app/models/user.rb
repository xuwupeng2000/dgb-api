class User < ActiveRecord::Base

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
    :registerable,
    :recoverable, 
    :rememberable, 
    :trackable
  has_many :customers
  has_many :product_users, :dependent => :destroy
  has_and_belongs_to_many :products, :through => :product_users
  has_many :orders, :dependent => :destroy
  has_many :deliverables, :through => :orders

  validates_presence_of :name, message: 'please enter name'
  validates_presence_of :email, message: 'please enter email'
  validates :email, email_format: { message: 'are you sure this is your email? Its format is invalid', allow_blank: true }
  validates :email, uniqueness:   { message: 'has been taken' }

  validates_presence_of     :password, message: 'please enter password', if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  
  validates_acceptance_of :accepted_terms, 
    accept: true, 
    allow_nil: false, 
    message: 'must be accepted' 

private

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

end
