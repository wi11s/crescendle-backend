class UserSerializer < ActiveModel::Serializer
  attributes :id, :guesses, :streak, :name, :interval_high_score
end
