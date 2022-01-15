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

  validates :movie_id, uniqueness: { scope: :list_id } # or: validates :list_id, uniqueness: { scope: :movie_id }

  # The comment of a bookmark cannot be shorter than 6 characters.  
  validates :comment, length: { minimum: 6 }  # or: validates_length_of :comment, minimum: 6
end


# schema

# create_table "bookmarks", force: :cascade do |t|
#   t.string "comment"
#   t.bigint "movie_id", null: false
#   t.bigint "list_id", null: false
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.index ["list_id"], name: "index_bookmarks_on_list_id"
#   t.index ["movie_id"], name: "index_bookmarks_on_movie_id"
# end