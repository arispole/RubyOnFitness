class WorkoutPlan < ApplicationRecord
  belongs_to :user
  has_many :exercise_routines, dependent: :destroy
  has_many :exercises, through: :exercise_routines

  validates :nome, presence: true

  end
