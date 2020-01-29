class PillsController < ApplicationController

   def index
      pills = Pill.all
      render json: pills.to_json(serialized_data)
    end
    def create
  
      pill = Pill.create(pills_strong_params)
      render json: pill.to_json(serialized_data)
    end
    
    private
      def serialized_data
        {:except => [:created_at, :updated_at]}
      end
      def pills_strong_params
        params.require(:pill).permit(
         :name,
         :purpose,
         :description,
         :dose,
         :pregnancy,
         :warnings,
         :stop_use,
         :brand,
         :route,
         :package_label
        )
      end
end
