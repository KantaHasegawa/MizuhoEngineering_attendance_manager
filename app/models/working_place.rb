class WorkingPlace < ApplicationRecord
  has_many :relationships, dependent: :destroy
  has_many :users, through: :relationships
  accepts_nested_attributes_for :relationships, allow_destroy: true
end
