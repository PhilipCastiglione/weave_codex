class StaticController < ApplicationController
  # GET /
  def index
  end

  # POST /static/publish
  def publish
    models = [Fauna]

    publish_data = models.each_with_object({}) do |model, data|
      data[model.name] = model.publish_data
    end

    File.open(Rails.root.parent.join("data", "entities.json"), "w") do |file|
      file.write(publish_data.to_json)
    end

    redirect_to root_url, notice: "Publishing complete."
  end
end
