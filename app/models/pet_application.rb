class PetApplication < ApplicationRecord
  belongs_to :pet
  belongs_to :application

  enum status: { Approved: "0", Rejected: "1", pending: "2"}
  attribute :status, :string, default: "2"
end
