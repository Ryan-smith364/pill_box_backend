class PillListsController < ApplicationController
   def index 
      pillLists = PillList.all
   end

   private

   def list_serializer
      {:except => [:created_at, :updated_at]}
   end

   def
      params.require(:PillList).permit(
         :name,
         :user_id
      )
   end
end
