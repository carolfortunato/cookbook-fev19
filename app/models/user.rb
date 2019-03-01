class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :recipes
  has_many :lists
  has_many :recipes_list, through: :lists, source: :recipes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
