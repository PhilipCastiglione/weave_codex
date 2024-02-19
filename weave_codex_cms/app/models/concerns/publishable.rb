
module Publishable
  extend ActiveSupport::Concern

  included do
    Publisher.register(self)
  end

  class_methods do
    def reflections_to_include
      self.reflections.keys - self.rich_text_association_names.map(&:to_s)
    end

    def publish_data
      self.all.includes(self.reflections_to_include.map(&:to_sym)).with_all_rich_text.map do |instance|
        reflection_fields = self.reflections_to_include.each_with_object({}) do |reflection, h|
          if self.reflections[reflection].collection?
            f = "#{reflection.singularize}_ids"
            h[f] = instance.send(reflection).map(&:id)
          else
            f = "#{reflection}_id"
            h[f] = instance.send(f)
          end
        end

        rich_text_fields = self.rich_text_association_names.each_with_object({}) do |association, h|
          f = association.to_s.split("rich_text_").last
          h[f] = instance.send(f).body.to_s
        end

        instance.as_json.merge(reflection_fields).merge(rich_text_fields)
      end
    end

    def publish_types
      publishable_attributes = {}

      self.reflections_to_include.each do |reflection|
        if self.reflections[reflection].collection?
          f = "#{reflection.singularize}_ids".to_sym
          publishable_attributes[f] = "number[]"
        end
      end

      self.rich_text_association_names.each do |association|
        f = association.to_s.split("rich_text_").last.to_sym
        publishable_attributes[f] = "string"
      end

      self.attribute_names.each do |attribute|        
        if self.attribute_types[attribute].instance_of?(ActiveModel::Type::String)
          publishable_attributes[attribute] = "string"
        elsif self.attribute_types[attribute].instance_of?(ActiveRecord::ConnectionAdapters::SQLite3Adapter::SQLite3Integer)
          publishable_attributes[attribute] = "number"
        elsif self.attribute_types[attribute].instance_of?(ActiveRecord::AttributeMethods::TimeZoneConversion::TimeZoneConverter)
          publishable_attributes[attribute] = "Date"
        end
      end

      types = "export default interface #{self.name} {\n"
      publishable_attributes.each do |attribute, type|
        types += "  #{attribute}: #{type}\n"
      end
      types += "}\n"

      types
    end
  end
end