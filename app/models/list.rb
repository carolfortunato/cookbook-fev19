class List < ApplicationRecord
  belongs_to :user
  has_many :list_recipes
  has_many :recipes, through: :list_recipes
end
