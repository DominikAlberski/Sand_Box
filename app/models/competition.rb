class Competition < ApplicationRecord
  has_many :sporters, through: :competition_results
  has_many :competition_results
end
