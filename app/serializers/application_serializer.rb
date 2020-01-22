# frozen_string_literal: true

# Serializer that holds common logic for serializers inheriting from this one.
class ApplicationSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id
end
