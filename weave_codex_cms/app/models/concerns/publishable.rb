# frozen_string_literal: true

# The Publishable concern can be included in any ActiveRecord model to include
# that model in the publishing pipeline.
#
# The two public methods use AR reflection methods to gather the data and types
# of the model's attributes and associations. The data is then used to generate
# a JSON representation of the model's data and a TypeScript interface.
module Publishable
  extend ActiveSupport::Concern

  included do
    Publisher.register(self)
  end

  class_methods do
    def publish_data
      all
        .includes(reflections_to_include.map(&:to_sym))
        .with_all_rich_text.map do |instance|
        instance.as_json.merge(
          instance_reflection_fields(instance),
          instance_rich_text_fields(instance)
        )
      end
    end

    def publish_types
      publishable_attributes = {}

      inject_reflection_collection_type_data(publishable_attributes)
      inject_rich_text_type_data(publishable_attributes)
      inject_attribute_type_data(publishable_attributes)

      transform_attributes_to_type_declarations(publishable_attributes)
    end

    private

    def reflections_to_include
      reflections.keys - rich_text_association_names.map(&:to_s)
    end

    def instance_reflection_fields(instance)
      reflections_to_include.each_with_object({}) do |reflection, h|
        if reflections[reflection].collection?
          f = "#{reflection.singularize}_ids"
          h[f] = instance.send(reflection).map(&:id)
        else
          f = "#{reflection}_id"
          h[f] = instance.send(f)
        end
      end
    end

    def instance_rich_text_fields(instance)
      rich_text_association_names.each_with_object({}) do |association, h|
        f = association.to_s.split('rich_text_').last
        h[f] = instance.send(f).body.to_s
      end
    end

    def inject_reflection_collection_type_data(publishable_attributes)
      reflections_to_include.each do |reflection|
        if reflections[reflection].collection?
          f = "#{reflection.singularize}_ids"
          publishable_attributes[f] = 'number[]'
        end
      end
    end

    def inject_rich_text_type_data(publishable_attributes)
      rich_text_association_names.each do |association|
        f = association.to_s.split('rich_text_').last
        publishable_attributes[f] = 'string'
      end
    end

    def inject_attribute_type_data(publishable_attributes) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
      attribute_names.each do |attribute|
        if attribute_types[attribute].instance_of?(ActiveModel::Type::String)
          publishable_attributes[attribute_with_suffix(attribute)] = 'string'
        elsif attribute_types[attribute].instance_of?(ActiveRecord::ConnectionAdapters::SQLite3Adapter::SQLite3Integer)
          publishable_attributes[attribute_with_suffix(attribute)] = 'number'
        elsif attribute_types[attribute].instance_of?(
          ActiveRecord::AttributeMethods::TimeZoneConversion::TimeZoneConverter
        )
          publishable_attributes[attribute_with_suffix(attribute)] = 'Date'
        end
      end
    end

    def transform_attributes_to_type_declarations(publishable_attributes)
      types = "export default interface #{name} {\n"

      publishable_attributes.each do |attribute, type|
        types += "  #{attribute}: #{type}\n"
      end

      types += "}\n"

      types
    end

    def attribute_with_suffix(attribute)
      has_no_validators = validators_on(attribute).empty?
      is_nullable = columns_hash[attribute].null
      has_no_validators && is_nullable ? "#{attribute}?" : attribute
    end
  end
end
