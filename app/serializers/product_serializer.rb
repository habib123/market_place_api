class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :price, :published, :updated_at
  has_one :user
end
