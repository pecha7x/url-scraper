class PageSerializer < ActiveModel::Serializer

  attributes :id, :url, :tags

  def tags
    object.tags.map do |tag|
      TagSerializer.new(tag)
    end
  end

end
