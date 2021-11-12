class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :posts, :created_at
end
