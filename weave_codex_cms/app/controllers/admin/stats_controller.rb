# frozen_string_literal: true

module Admin
  class StatsController < Admin::ApplicationController
    def index
      @stats = Publisher.registered_models.map do |model|
        {
          name: model.name,
          count: model.count,
          link: url_for(action: 'index', controller: "/admin/#{model.name.underscore.pluralize}")
        }
      end
    end
  end
end
