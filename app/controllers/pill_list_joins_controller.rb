class PillListJoinsController < ApplicationController
   def index 
      pillListJoins = PillListJoin.all
      render json: pillListJoins.to_json(join_serializer)
      
   end

   def create
      # byebug
      join = PillListJoin.create(pill_list_id: params[:pill_list_id], pill_id: params[:pill_id])
      render json: join.to_json(join_serializer)
   end


   private

   def join_serializer
      {:except => [:created_at, :updated_at]}
   end

   def join_strong_params
      params.require(:pill_list_join).permit(
         list_id,
         pill_id
      )
   end
end

