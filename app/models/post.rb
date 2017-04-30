class Post < ApplicationRecord
  #This validates presence of title, and makes sure that the length is not more than 140 words
  validates :title, presence: true, length: {maximum: 140}
  #This validates presence of body
  validates :body, presence: true
  validates :preview, presence: true, length: {maximum: 300}
end
