module Admin
  class StatsController < Admin::ApplicationController
    def index
      @stats = Constants::PUBLISHABLE_MODELS.map do |model|
        {
          "name": model.name,
          "count": model.count,
          "link": admin_faunas_path,
        }
      end
    end
  end
end
