# frozen_string_literal: true

module Admin
  class PublishingController < Admin::ApplicationController
    # because we're running locally and models load dynamically on first server start
    # to avoid having to refresh on first load we'll require the models here manually
    before_action :require_models

    def index
      @models = Publisher.registered_models.map do |model|
        {
          name: model.name,
          count: model.count,
          link: url_for(action: 'index', controller: "/admin/#{model.name.underscore.pluralize}")
        }
      end
    end

    def publish
      Publisher.publish

      redirect_to root_url, notice: 'Publishing complete.'
    end

    private

    def require_models
      Dir[Rails.root.join('app', 'models', '*.rb')].each do |file|
        require_dependency file
      end
    end
  end
end
