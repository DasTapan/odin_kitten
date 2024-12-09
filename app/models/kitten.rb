class Kitten < ApplicationRecord
    validates :name, length: {minimum: 3, message: "name it like a thug"}
    validates :age, numericality: {greater_than: 0, message: "is he born?"}
    enum :cuteness, [:kinda_cute,:pretty_cute,:very_cute,:too_cute,:ultimate_cuteness]
    enum :softness, [:feather_touch,:velvet_paw,:cloud_floof,:marshmallow_fluff,:silken_dream]
end
