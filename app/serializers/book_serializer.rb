
class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :price

  has_one :author

  has_one :publisher

end

