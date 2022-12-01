class IndividualStatSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :song_id, :number_of_plays, :completed
end
