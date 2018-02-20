class StatisticsController < ApplicationController
  def index

    @sporters = Sporter.all

    @sporters_in_country = {}
    Country.all.map do |c|
      @sporters_in_country[c.name] = c.sporters.count
    end

    @result_by_country = Country.all.map do |c|
      places = {}
      (1..6).each do |place|
        places[place] = c.sporters.joins(:competition_results).
            where("competition_results.place = #{place}").count
      end
      {
          name: c.name,
          data: places
      }
    end

    @competitions_in_country = Country.all.map do |c|
      data = c.sporters.joins(:competitions).group(:title).count
      { name: c.name,
        data: data}
    end

    @color = []
    50.times{ @color.push(SecureRandom.hex(3)) }


  end
end
