class ChartsController < ApplicationController
  def sporters_by_age
    result = Sporter.group(:age).count
    render json: [{name: 'Count', data: result},{name: 'sample', data: result}]
  end

  def language_by_time
    series_hash = {}
    Language.all.each do |l|
      lang_values = {}
      lang_values[l.created_at] = l.number
      if series_hash.key?(l.name)
        series_hash[l.name][l.created_at] = l.number
      else
        series_hash[l.name] = { l.created_at => l.number }
      end
    end

    returned_array = []
    series_hash.each_pair do |key, val|
      returned_array << { name: key, data: val }
    end
    puts returned_array
    render json: returned_array
  end
end

