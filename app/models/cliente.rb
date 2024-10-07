class Cliente < ApplicationRecord
    has_and_belongs_to_many :bombas
    validates :nombre, :razon_social, :ruc, presence: true
end
