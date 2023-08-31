class Kitten < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cuteness, numericality: { only_integer: true, in: 0..10 }
  validates :softness, numericality: { only_integer: true, in: 0..10 }
end
