class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates :cocktail, presence: true
  validates :ingredient, presence: true
  validates :cocktail,  uniqueness: { scope: [:ingredient] }

  accepts_nested_attributes_for :ingredient

end
