# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Movie.destroy_all

TopCast.destroy_all
# Generate models and tables, according to the domain model
# TODO!

# rails generate model Movie /( in terminal )
# rails generate model Top_Cast / (in terminal)
# rails db:migrate / (in terminal)

# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.
# TODO!


values = {
        movie_name: "Batman Begins",
        year: "2005",
        rate: "PG-13",
        director: "Christopher Nolan" 
}
movie = Movie.new(values)
movie.save

values = {
        movie_name: "The Dark Knight",
        year: "2008",
        rate: "PG-13",
        director: "Christopher Nolan" 
}
movie = Movie.new(values)
movie.save

values = {
        movie_name: "The Dark Knight Rises",
        year: "2012",
        rate: "PG-13",
        director: "Christopher Nolan" 
}
movie = Movie.new(values)
movie.save

# insert top casts
movie = Movie.where({movie_name: "Batman Begins"})[0]

cast = TopCast.new
cast.movie_id = "#{movie.id}"
cast.star_name = "Christian Bale"
cast.role = "Bruce Wayne"
cast.save

cast = TopCast.new
cast.movie_id = "#{movie.id}"
cast.star_name = "Michael Caine"
cast.role = "Alfred"
cast.save

cast = TopCast.new
cast.movie_id = "#{movie.id}"
cast.star_name = "Liam Neeson"
cast.role = "Ra's Al Ghul"
cast.save

cast = TopCast.new
cast.movie_id = "#{movie.id}"
cast.star_name = "Katie Holmes"
cast.role = "Rachel Dawes"
cast.save

cast = TopCast.new
cast.movie_id = "#{movie.id}"
cast.star_name = "Gary Oldman"
cast.role = "Commissioner Gordon"
cast.save

movie = Movie.where({movie_name: "The Dark Knight"})[0]

cast = TopCast.new
cast.movie_id = "#{movie.id}"
cast.star_name = "Christian Bale"
cast.role = "Bruce Wayne"
cast.save

cast = TopCast.new
cast.movie_id = movie.id
cast.star_name = "Heath Ledger"
cast.role = "Joker"
cast.save

cast = TopCast.new
cast.movie_id = movie.id
cast.star_name = "Aaron Eckhart"
cast.role = "Harvey Dent"
cast.save

cast = TopCast.new
cast.movie_id = movie.id
cast.star_name = "Michael Caine"
cast.role = "Alfred"
cast.save

cast = TopCast.new
cast.movie_id = movie.id
cast.star_name = "Maggie Gyllenhaal"
cast.role = "Rachel Dawes"
cast.save


movie = Movie.where({movie_name: "The Dark Knight Rises"})[0]

cast = TopCast.new
cast.movie_id = "#{movie.id}"
cast.star_name = "Christian Bale"
cast.role = "Bruce Wayne"
cast.save

cast = TopCast.new
cast.movie_id = "#{movie.id}"
cast.star_name = "Gary Oldman"
cast.role = "Commissioner Gordon"
cast.save

cast = TopCast.new
cast.movie_id = "#{movie.id}"
cast.star_name = "Tom Hardy"
cast.role = "Bane"
cast.save

cast = TopCast.new
cast.movie_id = "#{movie.id}"
cast.star_name = "Joseph Gordon-Levitt"
cast.role = "John Blake"
cast.save

cast = TopCast.new
cast.movie_id = "#{movie.id}"
cast.star_name = "Anne Hathaway"
cast.role = "Selina Kyle"
cast.save



# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""


# Query the movies data and loop through the results to display the movies output
# TODO!

movies = Movie.all
for movie in movies
    puts "#{movie.movie_name}    #{movie.year}    #{movie.rate}    #{movie.director}"
end


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""


# Query the cast data and loop through the results to display the cast output for each movie
# TODO!
for movie in movies
    casts = TopCast.where(movie_id: movie.id)
    for cast in casts
        puts "#{movie.movie_name}   #{cast.star_name}    #{cast.role} "
    end
end
