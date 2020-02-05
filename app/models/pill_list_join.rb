class PillListJoin < ApplicationRecord
   belongs_to :pill
   belongs_to :pill_list
end
