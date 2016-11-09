module ForecastIO
  class Forecast < Request
    def coordinates(latitude:, longitude:, time: nil, **opts)
      path = [latitude, longitude, time].compact.join(',')
      path << "?#{build_query(opts)}" if opts.any?
      puts path
      res = request(:get, path)
      build_forecast(res)
    end

    private

    def build_forecast(attrs)
      Entities::Forecast.new(attrs)
    end
  end
end
