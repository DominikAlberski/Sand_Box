module ChartHelper
  def sporters_by_age(data)
    column_chart data.group(:age).count, xtitle: "Age", ytitle: "number of sporters"
  end

  def sporters_by_age_async
    column_chart sporters_by_age_charts_path, refresh: 5
  end

  def competitions_chart(data)
    column_chart data, legend: false, stacked: true, colors: @color
  end

  def language_time_chart
    line_chart language_by_time_charts_path, refresh: 5
  end
end
