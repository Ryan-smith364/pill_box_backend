class PillList < ApplicationRecord
   belongs_to :user
   has_many :pill_list_joins
   has_many :pills, :through => :pill_list_joins
end
