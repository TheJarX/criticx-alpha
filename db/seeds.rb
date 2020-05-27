def load_data(file:)
  require 'json'
  JSON.parse(File.read("db/data/#{file}"), { symbolize_names: true })
end

# Companies
companies = load_data(file: 'companies.json')

companies.each do |company|
  Company.find_or_create_by(
    name: company[:name],
    description: company[:description],
    start_date: company[:start_date],
    country: company[:country]
  )
end

# Platforms
platforms = load_data(file: 'platforms.json')

platforms.each do |platform|
  Platform.find_or_create_by(
    name: platform[:name],
    category: platform[:category]
  )
end

# Genres
load_data(file: 'genres.json')[:genres].each do |genre|
  Genre.find_or_create_by(name: genre)
end

# Games and related
games = load_data(file: 'games.json')

games.each do |game|
  p db_game = Game.find_or_create_by( game.slice(:name, :summary, :release_date, :category, :rating) )

  if db_game
    unless game[:genres].nil?
      game[:genres].each do |genre|
        db_game.genres << Genre.find_or_create_by(name: genre)
      end
    end

    unless game[:platforms].nil?
      game[:platforms].each do |platform|
        db_game.platforms << Platform.find_or_create_by(name: platform[:name], category: platform[:category])
      end
    end

    unless game[:platforms].nil?
      game[:involved_companies].each do |company|
        InvolvedCompany.find_or_create_by(
          company_id: Company.find_by(name: company[:name]).id,
          game_id: db_game.id,
          developer: company[:developer],
          publisher: company[:publisher]
        )
      end
    end

  end
end