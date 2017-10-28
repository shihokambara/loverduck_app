class ReactionLog < ApplicationRecord
  belongs_to :user
  belongs_to :alert
  enum status: { calling: 0, completed: 1, not_completed: 2}
end
