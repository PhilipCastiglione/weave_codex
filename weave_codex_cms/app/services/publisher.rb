# frozen_string_literal: true

module Publisher
  REGISTERED_MODELS = Set.new

  class << self
    def registered_models
      REGISTERED_MODELS.to_a
    end

    def register(model)
      REGISTERED_MODELS.add(model)
    end

    def publish
      publish_entities_data
      publish_model_type_declarations
      publish_entities_type_declaration
    end

    def publish_entities_data
      entities_data = REGISTERED_MODELS.each_with_object({}) do |model, obj|
        obj[model.name] = model.publish_data
      end

      File.write(Rails.root.parent.join('data', 'entities.json'), entities_data.to_json)
    end

    def publish_model_type_declarations
      REGISTERED_MODELS.each do |model|
        File.write(Rails.root.parent.join('data', 'types', "#{model.name}.d.ts"), model.publish_types)
      end
    end

    def publish_entities_type_declaration
      File.open(Rails.root.parent.join('data', 'types', 'Entities.d.ts'), 'w') do |file|
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

  private_class_method :publish_entities_data, :publish_model_type_declarations, :publish_entities_type_declaration
end
