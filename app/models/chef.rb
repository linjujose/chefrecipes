class Chef < ApplicationRecord
    before_save {self.email = email.downcase}
    validates :chefname, presence: true, length: {maximum: 30}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 100},
                        format: {with: VALID_EMAIL_REGEX},
                        uniqueness: {case_sensitive: false}

    has_many :recipes, dependent: :destroy
    has_secure_password # enforces password won't be nil at signup
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    has_many :comments, dependent: :destroy
end