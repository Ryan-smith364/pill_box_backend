class UsersController < ApplicationController
   def index
      users = User.all
      render json: users.to_json(user_serializer)
   end

   def create 
      new_user = User.create(user_strong_params)
      render json: new_user.to_json(user_serializer)
   end

   def login
      # byebug
      user = User.find_by(username: params[:username])
      # byebug
      if user
         render json: user.to_json(user_serializer)
      else
          render json: {
            error: true,
            message: "Incorrect User or password!"
          }
      end
    end

   private

   def user_serializer
      {:except => [:password, :created_at, :updated_at],
        include: [
            pill_lists: {
               except: [:created_at, :updated_at],
               include: [
                   pills: {
                        except: [:created_at, :updated_at]
                     }
               ]
            }
        ]        
   }
   end

   def user_strong_params
      params.require(:user).permit(
         :username,
         :email,
         :first_name,
         :last_name,
         :password 
      )
   end
end
