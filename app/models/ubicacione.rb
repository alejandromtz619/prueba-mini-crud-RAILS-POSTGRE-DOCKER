class Ubicacione < ApplicationRecord
    belongs_to :paise, class_name: 'Paise', foreign_key: 'pais_id'
    belongs_to :ciudade, class_name: 'Ciudade', foreign_key: 'ciudad_id'
    validates :direccion, :ciudad_id, :pais_id, presence: true
end
