class Api::V1::TagSerializer < ActiveModel::Serializer
  # attributes :id, :name
  # has_ancestry
  # attributes :id, :name, :children


  attributes(*Tag.attribute_names.map(&:to_sym))

  # attributes(*Tag.attribute_names.arrange_serializable.to_json(&:to_sym))

end
