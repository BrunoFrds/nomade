class Reservation < ApplicationRecord
  before_create :generate_token  # Génère un token unique avant la création d'une réservation

  validates :first_name, :last_name, :email, :date, :people, presence: true
  validates :people, numericality: { only_integer: true, greater_than: 0 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  private

  # Callback pour définir la réservation avant certaines actions
  def generate_token
    self.token = SecureRandom.hex(10)
  end
  
end
