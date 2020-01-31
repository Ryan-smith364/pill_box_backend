class PillListsController < ApplicationController
   def index 
      pillLists = PillList.all
      
   end

   def create
      new_list = PillList.create(list_strong_params)
      render json: new_list.to_json(list_serializer)
   private

   def list_serializer
      {:except => [:created_at, :updated_at]}
   end

   def list_strong_params
      params.require(:PillList).permit(
         :name,
         :user_id
      )
   end
end
