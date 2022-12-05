class UserSerializer < ActiveModel::Serializer
  attributes :id, :guesses, :streak
end
