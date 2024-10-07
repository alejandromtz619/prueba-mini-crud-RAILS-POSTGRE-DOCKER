class Bomba < ApplicationRecord
    has_and_belongs_to_many :clientes
end
