class Ingredient < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }, 
                                    uniqueness: { case_sensitive: false }
    #validates_uniqueness_of :name
end