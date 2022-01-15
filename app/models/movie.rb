class Movie < ApplicationRecord
  # A movie has many bookmarks
  # You can’t delete a movie if it is referenced in at least one bookmark.
  has_many :bookmarks

  # A movie must have a unique title and an overview.
  # validates :title, :overview, presence: true, uniqueness: true
  validates :title, uniqueness: true  
  validates :title, :overview, presence: true
end
