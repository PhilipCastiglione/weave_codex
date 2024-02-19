require 'set'

module Publisher
  REGISTERED_MODELS = Set.new

  def self.registered_models
    REGISTERED_MODELS.to_a
  end

  def self.register(model)
    REGISTERED_MODELS.add(model)
  end

  def self.publish
    entities_publish_data = REGISTERED_MODELS.each_with_object({}) do |model, obj|
      obj[model.name] = model.publish_data
    end

    File.open(Rails.root.parent.join("data", "entities.json"), "w") do |file|
      file.write(entities_publish_data.to_json)
    end

    entities_publish_types = REGISTERED_MODELS.each do |model|
      File.open(Rails.root.parent.join("data", "types", "#{model.name}.d.ts"), "w") do |file|
        file.write(model.publish_types)
      end
    end

    File.open(Rails.root.parent.join("data", "types", "Entities.d.ts"), "w") do |file|
      REGISTERED_MODELS.each do |model|
        file.write("import type #{model.name} from './#{model.name}'\n")
      end
      
      file.write("\nexport default interface Entities {\n")
      
      REGISTERED_MODELS.each do |model|
        file.write("  #{model.name}: #{model.name}[]\n")
      end

      file.write("}\n")
    end
  end
end
