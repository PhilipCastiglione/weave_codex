# frozen_string_literal: true

require 'administrate/base_dashboard'

class CharacterDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    domain: Field::BelongsTo,
    name: Field::String,
    organization: Field::BelongsTo,
    species: Field::BelongsTo,
    background: Field::Text, # TODO: change to rtf and add to form attributes
    physical_description: Field::Text, # TODO: change to rtf and add to form attributes
    personality: Field::Text, # TODO: change to rtf and add to form attributes
    other_notes: Field::Text, # TODO: change to rtf and add to form attributes
    created_at: Field::DateTime,
    updated_at: Field::DateTime
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
    species
    domain
    organization
    background
    physical_description
    personality
    other_notes
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    species
    domain
    organization
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

  # Overwrite this method to customize how characters are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(character)
    "Character #{character.name} (##{character.id})"
  end
end
