class ProjectSerializer < ActiveModel::Serializer
  attributes :label,# :value

  def label
    object.name
  end

  def value
    object.id
  end
end