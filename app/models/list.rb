# rails g model list name
class List < ApplicationRecord
  # A list has many bookmarks
  # When you delete a list, you should delete all associated bookmarks...
  # (but not the movies as they can be referenced in other lists).
  has_many :bookmarks, dependent: :destroy

  # A list has many movies through bookmarks
  has_many :movies, through: :bookmarks

  # A list must have a unique name.
  validates :name, presence: true, uniqueness: true
end
