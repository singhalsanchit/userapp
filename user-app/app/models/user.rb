class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :assign_default_role

  has_one :secret_code
  ROLES = %i[user admin]

  def self.find_for_database_authentication(conditions={})
    find_by(user_name: conditions[:email]) || find_by(email: conditions[:email])
  end

  def admin?
    has_role?(:admin)
  end

  def user?
    has_role?(:user)
  end 

  private
  #new user will be assigned a role of user
  def assign_default_role
    add_role(:user)
  end

end
