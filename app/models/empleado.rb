class Empleado < ApplicationRecord
    belongs_to :persona, class_name: 'Persona', foreign_key: 'persona_id'
    belongs_to :cargo, class_name: 'Cargo', foreign_key: 'cargo_id'
    belongs_to :ubicacione, class_name: 'Ubicacione', foreign_key: 'ubicacion_id'
    belongs_to :ciudade, class_name: 'Ciudade', foreign_key: 'ciudad_id'
    belongs_to :paise, class_name: 'Paise', foreign_key: 'pais_id'
  
    validates :persona_id, :cargo_id, :ubicacion_id, :ciudad_id, :pais_id, presence: true
  end
  