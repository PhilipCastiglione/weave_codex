class StaticController < ApplicationController
  # GET /
  def index
  end

  # POST /static/publish
  def publish
    entities_publish_data = Constants::PUBLISHABLE_MODELS.each_with_object({}) do |model, obj|
      obj[model.name] = model.publish_data
    end

    File.open(Rails.root.parent.join("data", "entities.json"), "w") do |file|
      file.write(entities_publish_data.to_json)
    end

    entities_publish_types = Constants::PUBLISHABLE_MODELS.each do |model|
      File.open(Rails.root.parent.join("data", "types", "#{model.name}.d.ts"), "w") do |file|
        file.write(model.publish_types)
      end
    end

    File.open(Rails.root.parent.join("data", "types", "Entities.d.ts"), "w") do |file|
      Constants::PUBLISHABLE_MODELS.each do |model|
        file.write("import type #{model.name} from './#{model.name}'\n")
      end
      
      file.write("\nexport default interface Entities {\n")
      
      Constants::PUBLISHABLE_MODELS.each do |model|
        file.write("  #{model.name}: #{model.name}[]\n")
      end

      file.write("}\n")
    end

    redirect_to root_url, notice: "Publishing complete."
  end
end
