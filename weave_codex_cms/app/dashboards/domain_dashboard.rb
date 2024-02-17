require "administrate/base_dashboard"

class DomainDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    rich_text_description: Field::Text, # TODO: change this to a rich text field and add to the form attributes
    rich_text_philosophy_religion_and_magic: Field::Text, # TODO: change this to a rich text field and add to the form attributes
    rich_text_politics_economics_and_law: Field::Text, # TODO: change this to a rich text field and add to the form attributes
    rich_text_sociocultural: Field::Text, # TODO: change this to a rich text field and add to the form attributes
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    name
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    rich_text_description
    rich_text_philosophy_religion_and_magic
    rich_text_politics_economics_and_law
    rich_text_sociocultural
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how domains are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(domain)
    "Domain #{domain.name} (##{domain.id})"
  end
end
