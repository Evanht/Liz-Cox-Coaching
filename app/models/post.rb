class Post < ApplicationRecord
  #This validates presence of title, and makes sure that the length is not more than 140 words
  mount_uploader :photo, PostUploader
  validates :title, presence: true, length: {maximum: 140}
  #This validates presence of body
  validates :body, presence: true
  validates :photo, presence: true
  validates :preview, presence: true, length: {maximum: 270}
end
