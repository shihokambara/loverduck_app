class Alert < ApplicationRecord
  belongs_to :duck
  has_many :reaction_logs
end
