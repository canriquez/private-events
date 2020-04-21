class Event < ApplicationRecord

    belongs_to :creator, class_name: "user"
end
