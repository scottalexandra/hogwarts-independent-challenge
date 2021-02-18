class Student < ApplicationRecord
  validates :name, :age, presence: true

  has_many :professor_students
  has_many :professors, through: :professor_students
end
