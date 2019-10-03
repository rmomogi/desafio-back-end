class Transaction < ApplicationRecord
  belongs_to :store
  belongs_to :transaction_type

  validates :value, presence: true
  validates :cpf, presence: true
  validates :card, presence: true
  validates :occurrence_at, presence: true
end
