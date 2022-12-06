class GoalSerializer < ActiveModel::Serializer
  attributes :id, :content, :complete, :complete_by
end
