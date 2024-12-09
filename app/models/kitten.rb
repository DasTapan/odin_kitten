class Kitten < ApplicationRecord
    validates :name, length: {minimum: 3, message: "name it like a thug"}
    validates :age, numericality: {greater_than: 0, message: "how old?"}
    validates :cuteness, length: {minimum: 3, message: "bhala laguni?"}
    validates :softness, length: {minimum: 3, message: "nahi maunsa?"}
end
