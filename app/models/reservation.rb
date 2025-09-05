class Reservation < ApplicationRecord
  validates :last_name, :first_name, :email, :date, :people, presence: true
  validates :people, numericality: { only_integer: true, greater_than: 0 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
