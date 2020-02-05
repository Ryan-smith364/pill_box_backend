class PillListsController < ApplicationController
   def index 
      pillLists = PillList.all
      render json: pillLists.to_json(list_serializer)
      
   end

   def create
      # byebug
      new_list = PillList.create(list_strong_params)
      render json: new_list.to_json(list_serializer)
   end


   private

   def list_serializer
      {:except => [:created_at, :updated_at],
      include: [
         pills: {
            except: [:created_at, :updated_at]
         }
      ]
   }
   end

   def list_strong_params
      params.require(:pill_list).permit(
         :name,
         :desc,
         :user_id
      )
   end
end
