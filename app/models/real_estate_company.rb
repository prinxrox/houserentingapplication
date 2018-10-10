class RealEstateCompany < ApplicationRecord
  has_many :realtors
  has_many :houses
end
