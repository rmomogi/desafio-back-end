class TransactionType < ApplicationRecord
  validates :name, presence: true
  validates :operation, presence: true, inclusion: { in: %w[entry output] }
end
