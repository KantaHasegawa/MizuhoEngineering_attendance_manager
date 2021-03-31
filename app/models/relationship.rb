class Relationship < ApplicationRecord
  validates :user_id, uniqueness: { scope: :working_place_id }
  belongs_to :user
  belongs_to :working_place
end
