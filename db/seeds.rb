require "open-uri"

the_moviedb_api_key = "54f1fc747dbb59d143287facc3ba5f71"
  
def create_bookmarks(list, bookmark_count, movie_id_array)
  # returns array of unique-non-repeating movie_ids from array
  unique_movie_id = movie_id_array.sample(bookmark_count)
  bookmark_count.times do |t|
    Bookmark.create!(
      comment: "#{[Faker::Company.catch_phrase, Faker::Company.bs].join(" ")}.",
      movie_id: unique_movie_id[t], list_id: list.id
    )
  end
end

puts "Destroying all previous records(bookmarks, movies, lists)..."
# next line also destroys movie_image due to dependent destroy
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all
puts "Creating movies..."

10.times do
  # tmdb(themovidedb), get a random page
  url = "https://api.themoviedb.org/3/movie/popular?api_key=#{the_moviedb_api_key}&language=en-US&page=#{rand(1..30)}"
  puts "url: #{url}"
  rand_num = rand(0..19)
  puts "rand_num: #{rand_num}"
  # get a random movie from the random selected page
  tmdb = JSON.parse(URI.open(url).read)["results"][rand_num]
  # may occasionally throw errors
  puts "#{tmdb}"
  puts "=-=-=-=-=-=-="
  Movie.create!(
    title: tmdb["title"],
    # present checks if string has a value
    overview: tmdb["overview"].present? ? tmdb["overview"] : "#{[Faker::Company.catch_phrase, Faker::Company.bs].join(" ")}." ,
    poster_url: "https://image.tmdb.org/t/p/original#{tmdb['poster_path']}",
    rating: tmdb["vote_average"]
  )
end
puts "Creating movies completed..."
puts "Creating lists..."
List.create!(name: "Inspiring")
first_list = List.last
List.create!(name: "Adventure")
seconnd_list = List.last
List.create!(name: "Fantasy")
third_list = List.last
List.create!(name: "Documentary")
fourth_list = List.last
List.create!(name: "Comedy")
List.create!(name: "Drama")
List.create!(name: "Anime")
List.create!(name: "3D")
puts "Creating lists completed..."
puts "Creating bookmarks..."
movie_id_min = Movie.first.id
movie_id_max = Movie.last.id
movie_id_array = (movie_id_min..movie_id_max).to_a
create_bookmarks(first_list, 1, movie_id_array)
create_bookmarks(seconnd_list, 3, movie_id_array)
create_bookmarks(third_list, 5, movie_id_array)
create_bookmarks(fourth_list, 8, movie_id_array)
puts "Creating bookmarks completed..."
puts "ID List"
puts "Movie: count/min/max/ #{Movie.count} #{movie_id_min}, #{movie_id_max}"
puts "List: count/min/max/ #{List.count} #{List.first.id}, #{List.last.id}"
puts "Bookmark: count/min/max/ #{Bookmark.count} #{Bookmark.first.id}, #{Bookmark.last.id}"


def old_movie_seeds
  Movie.create!(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
  Movie.create!(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
  Movie.create!(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
  Movie.create!(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
end