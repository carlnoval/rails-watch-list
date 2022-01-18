class Bookmark < ApplicationRecord
  # A bookmark belongs to a movie
  # A bookmark belongs to a list
  belongs_to :movie
  belongs_to :list

  # A bookmark must be linked to a movie and a list, and the [movie, list] pairings should be unique.
  # validates_uniqueness_of :comment, scope: [:movie_id, :list_id]
  # validates_uniqueness_of :id, scope: [:movie_id, :list_id]
  # validates_uniqueness_of :comment, scope: [:movie_id, :list_id]
  # validates_uniqueness_of :bookmark_id, scope: [:movie_id, :list_id]
  # validates_uniqueness_of :self, scope: [:movie_id, :list_id]
  # validates_uniqueness_of object.self, scope: [:movie_id, :list_id]

  validates :movie_id, uniqueness: { scope: :list_id, message: "already has a comment, pick a different movie to comment on"} # or: validates :list_id, uniqueness: { scope: :movie_id }

  # The comment of a bookmark cannot be shorter than 6 characters.  
  validates :comment, length: { minimum: 6 }  # or: validates_length_of :comment, minimum: 6
end
