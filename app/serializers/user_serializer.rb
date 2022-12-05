class UserSerializer < ActiveModel::Serializer
  attributes :id, :guesses, :streak, :name
end
