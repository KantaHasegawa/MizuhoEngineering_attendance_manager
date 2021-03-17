class WorkingPlace < ApplicationRecord
  validates :address, presence: true
  validates :address, uniqueness: true
  has_many :relationships, dependent: :destroy
  has_many :users, through: :relationships
  accepts_nested_attributes_for :relationships, allow_destroy: true
  geocoded_by :address
  after_validation :geocode
end
