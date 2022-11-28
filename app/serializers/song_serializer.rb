class SongSerializer < ActiveModel::Serializer
  attributes :id, :name, :artist, :abc_notation, :info, :user_id
end
