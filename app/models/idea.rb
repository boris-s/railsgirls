class Idea < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :comments

  # FIXME: co s comments po idea.destroy
  # FIXME: vazba na usera
end
