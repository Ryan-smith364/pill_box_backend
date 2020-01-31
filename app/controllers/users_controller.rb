class UsersController < ApplicationController
   def index
      users = User.all

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
