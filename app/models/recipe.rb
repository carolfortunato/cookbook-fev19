class Recipe < ApplicationRecord
  belongs_to :recipe_type
  belongs_to :cuisine
  belongs_to :user
  validates :title, :recipe_type, :cuisine, :difficulty, :cook_time, :ingredients, :cook_method, presence: true
  validates :cook_time, numericality: { greater_than: 0}
  has_one_attached :photo
  has_many :lists
  def cook_time_min
    "#{cook_time} minutos"
  end
end
