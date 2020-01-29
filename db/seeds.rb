# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'

Pill.destroy_all

data = RestClient.get 'https://api.fda.gov/drug/label.json?limit=100'

json_data = JSON.parse(data.body)

pills = []

json_data['results'].each do |pill|
    if pill['openfda']['generic_name'] != nil 
      pills << pill
    end
    
end

# p pills

pills.each do |pill|
   Pill.create( name: pill['openfda']["generic_name"], purpose: pill["purpose"], description: pill["description"], dose: pill["dosage_and_administration"], pregnancy: pill["pregnancy"], warnings: pill["warnings"], stop_use: pill["stop_use"], brand: pill['openfda']["brand_name"], route: pill['openfda']["route"], package_label: pill["package_label_principal_display_panel"] )
end

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
