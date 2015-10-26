class Chef < ActiveRecord::Base
  has_many :recipes

  before_save { self.email = email.downcase } # Lecture 26 - Min 17:00 - just need to provide self once

  validates :chefname,
            presence: true,
            length: { minimum: 3, maximum: 40 }

  VALIDATE_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i # Lecture 26 - Min 14:00

  validates :email,
            presence: true,
            length: { maximum: 55 },
            uniqueness: { case_sensitive: false },
            format: { with: VALIDATE_EMAIL_REGEX } # Lecture 26 - Min 9:00
end
