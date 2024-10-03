class Persona < ApplicationRecord
    belongs_to :cargo
    validates :nombre, :edad, :cargo_id, presence: true
  end
  