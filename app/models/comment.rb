class Comment < ApplicationRecord
  belongs_to :idea
  has_one :user

  # FIXME: vazba na usera
end
