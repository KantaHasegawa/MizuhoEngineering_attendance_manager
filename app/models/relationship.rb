class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :working_place
end
