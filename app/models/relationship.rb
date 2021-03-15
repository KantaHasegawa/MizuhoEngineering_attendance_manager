class Relationship < ApplicationRecord
  belongs_to :user, class_name: "user", foreign_key: "user_id"
  belongs_to :working_place, class_name: "working_place", foreign_key: "working_place_id"
end
