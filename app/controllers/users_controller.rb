class UsersController < ApplicationController
   def index
      users = User.all
      render json: users.to_json(user_serializer)
   end

   def create 
      new_user = User.create(user_strong_params)
       render json: new_user.to_json(user_serializer)
   end

   private

   def user_serializer
      {:except => [:created_at, :updated_at]}
   end

   def user_strong_params
      params.require(:USER).permit(
         :username,
         :email,
         :first_name,
         :last_name
      )
   end
end
