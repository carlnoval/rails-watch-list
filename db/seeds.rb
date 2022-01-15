puts "Destroying all previous records(bookmarks, movies, lists)..."
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all
puts "Creating movies..."
Movie.create!(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create!(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create!(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create!(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
puts "Creating movies completed..."
puts "Creating lists..."
4.times do |count|
  # +1 cuase count starts at zero
  List.create!(name: "List#{count + 1}")
end
puts "Creating lists completed..."
puts "Creating bookmarks..."
Bookmark.create!(comment: "Comment1", movie_id: Movie.first.id, list_id: List.first.id)
Bookmark.create!(comment: "Comment2", movie_id: (Movie.first.id + 1), list_id: List.first.id)
Bookmark.create!(comment: "Comment3", movie_id: (Movie.first.id + 2), list_id: List.first.id + 1)
Bookmark.create!(comment: "Comment4", movie_id: (Movie.first.id + 3), list_id: List.first.id + 1)
puts "Creating bookmarks completed..."
puts "ID List"
puts "Movie: count/min/max/ #{Movie.count} #{Movie.first.id}, #{Movie.last.id}"
puts "List: count/min/max/ #{List.count} #{List.first.id}, #{List.last.id}"
puts "Bookmark: count/min/max/ #{Bookmark.count} #{Bookmark.first.id}, #{Bookmark.last.id}"