# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'

Pill.destroy_all

data = RestClient.get 'https://api.fda.gov/drug/label.json?search=_exists_:openfda&limit=100'

json_data = JSON.parse(data.body)

pills = []

json_data['results'].each do |pill|
   #  if pill['openfda']['generic_name'] != nil 
      

      repill = {name: nil , purpose: nil , description: nil , dose: nil , pregnancy: nil , warnings: nil , stop_use: nil , brand: nil , route: nil ,package_label: nil}
      
      if pill['openfda']["brand_name"]
         names = pill['openfda']["brand_name"][0].split(',')
         repill[:name] = names[0]
      end

      if pill["purpose"]
         repill[:purpose] = pill["purpose"][0]
      end

      if pill["description"]
         repill[:description] = pill["description"][0]
      end

      if pill["dosage_and_administration"]
         repill[:dosage] = pill["dosage_and_administration"][0]
      end

      if pill["pregnancy"]
         repill[:pregnancy] = pill["pregnancy"][0]
      end

      if pill["warnings"]
         repill[:warnings] = pill["warnings"][0]
      end

      if pill["stop_use"]
         repill[:stop_use] = pill["stop_use"][0]
      end

      if pill['openfda']["manufacturer_name"]
         repill[:brand] = pill['openfda']["manufacturer_name"][0]
      end

      if pill['openfda']["route"]
         repill[:route] = pill['openfda']["route"][0]
      end

      if pill["package_label_principal_display_panel"]
         repill[:package_label] = pill["package_label_principal_display_panel"][0]
      end
      p pill
      pills << repill
   #  end
    
end

# p pills

pills.each do |pill|
   Pill.create( name: pill[:name], purpose: pill[:purpose], description: pill[:description], dose: pill[:dose], pregnancy: pill[:pregnancy], warnings: pill[:warnings], stop_use: pill[:stop_use], brand: pill[:brand], route: pill[:route], package_label: pill[:package_label] )
end

list1 = PillList.create(name: 'Am Pills', desc: 'pills for the morning', user_id: 1)

# :name,
# :purpose,
# :description,
# :dose,
# :pregnancy,
# :warnings,
# :stop_use,
# :brand,
# :route,
# :package_label
