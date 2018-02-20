class Sporter < ApplicationRecord
  belongs_to :country
  has_many :competitions, through: :competition_results
  has_many :competition_results
end
