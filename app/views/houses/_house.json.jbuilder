json.extract! house, :id, :location, :sqft, :yearbuilt, :style, :price, :floors, :basement, :currentowner, :real_estate_company_id, :realtor_id, :created_at, :updated_at
json.url house_url(house, format: :json)
