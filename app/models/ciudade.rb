class Ciudade < ApplicationRecord
    belongs_to :paise, class_name: 'Paise', foreign_key: 'pais_id'
    validates :ciudad, :pais_id, presence: true
  end
  