# Create sample players
players = ["Alice", "Bob", "Charlie", "Diana"].map do |name|
  Player.find_or_create_by!(name: name)
end

# Create sample matches
[
  { winner: "Alice",   loser: "Bob",     days_ago: 7 },
  { winner: "Charlie", loser: "Diana",   days_ago: 6 },
  { winner: "Alice",   loser: "Charlie", days_ago: 5 },
  { winner: "Bob",     loser: "Diana",   days_ago: 4 },
  { winner: "Alice",   loser: "Diana",   days_ago: 3 },
  { winner: "Charlie", loser: "Bob",     days_ago: 2 }
].each do |data|
  winner = Player.find_by!(name: data[:winner])
  loser  = Player.find_by!(name: data[:loser])
  Match.find_or_create_by!(winner: winner, loser: loser, played_at: data[:days_ago].days.ago)
end

puts "Seeded #{Player.count} players and #{Match.count} matches."
