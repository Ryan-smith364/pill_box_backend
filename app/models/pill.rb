class Pill < ApplicationRecord
   has_many :pill_list_joins
   has_many :pill_lists, :through => :pill_list_joins
end
