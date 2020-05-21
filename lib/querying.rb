def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year
   FROM books
   INNER JOIN series
   ON books.series_id = series.id
   WHERE series.id = (SELECT MIN(id) FROM series)
   ORDER BY books.year;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name, characters.motto
   FROM characters
   ORDER BY LENGTH(characters.motto) DESC LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT characters.species, COUNT(characters.species)
   FROM characters
   GROUP BY characters.species
   ORDER BY COUNT(characters.species) DESC LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
   FROM authors
   INNER JOIN series
   ON authors.id = series.author_id
   INNER JOIN subgenres 
   ON subgenres.id = series.subgenre_id
   GROUP BY authors.name;
"
end

def select_series_title_with_most_human_characters
  "SELECT series.title
   FROM characters
   INNER JOIN series
   ON characters.author_id = series.author_id
   GROUP BY series.title
   ORDER BY SUM(CASE WHEN characters.species = \"human\" THEN 
   1 ELSE 0 END) DESC LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(*)
   FROM characters
   INNER JOIN character_books
   ON characters.id = character_books.character_id
   INNER JOIN books
   on character_books.book_id = books.id
   GROUP BY characters.name
   ORDER BY COUNT(*) DESC, characters.name;"
end
