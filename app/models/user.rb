class User < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :groups, through: :group_members
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
