# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def num_points_scored(name)
  hash = game_hash
  hash.each do |loc, team|
    team.each do |k, v|
      if k == :players
        v.each do |player|
          return player[:points] if player[:player_name] == name
        end
      end
    end
  end
end

def shoe_size(name)
  hash = game_hash
  hash.each do |loc, team|
    team.each do |k, v|
      if k == :players
        v.each do |player|
          return player[:shoe] if player[:player_name] == name
        end
      end
    end
  end
end

def team_colors(team_name)
  hash = game_hash
  hash.each do |loc, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names
  hash = game_hash
  arr = []
  hash.each { |loc, team| arr << team[:team_name] }
  arr
end

def player_numbers(team_name)
  hash = game_hash
  arr = []
  hash.each do |loc, team|
    if team[:team_name] == team_name
      team.each do |k, v|
      if k == :players
        v.each do |player|
          arr << player[:number]
        end
      end
    end
    end
  end
  arr
end

def player_stats(name)
  hash = game_hash
  hash.each do |loc, team|
    team.each do |k, v|
      if k == :players
        v.each do |player|
          return player if player[:player_name] == name
        end
      end
    end
  end
end

def biggest_shoe_size
  hash = game_hash
  max = 0
  hash.each do |loc, team|
    team.each do |k, v|
      if k == :players
        v.each do |player|
          max = player[:shoe] if player[:shoe] > max
        end
      end
    end
  end
  return max
end

def big_shoe_rebounds
  hash = game_hash
  size = biggest_shoe_size
  hash.each do |loc, team|
    team.each do |k, v|
      if k == :players
        v.each do |player|
          return player[:rebounds] if player[:shoe] == size
        end
      end
    end
  end
end

def most_points_scored
  hash = game_hash
  max = 0
  hash.each do |loc, team|
    team.each do |k, v|
      if k == :players
        v.each do |player|
          max = player[:points] if player[:points] > max
        end
      end
    end
  end
  return max
end

def total_points(team_name)
  hash = game_hash
  total = 0
  hash.each do |loc, team|
    if team[:team_name] == team_name
      team.each do |k, v|
        if k == :players
          v.each do |player|
            total += player[:points]
          end
        end
      end
    end
  end
  total
end

def winning_team
  hash = game_hash
  home = total_points(hash[:home][:team_name])
  away = total_points(hash[:away][:team_name])
  return home > away ? hash[:home][:team_name] : hash[:away][:team_name]
end

def longest_name_count
  hash = game_hash
  max = 0
  hash.each do |loc, team|
    team.each do |k, v|
      if k == :players
        v.each do |player|
          max = player[:player_name].length if player[:player_name].length > max
        end
      end
    end
  end
  max
end

def most_steals
  hash = game_hash
  max = 0
  hash.each do |loc, team|
    team.each do |k, v|
      if k == :players
        v.each do |player|
          max = player[:steals] if player[:steals] > max
        end
      end
    end
  end
  return max
end

def player_with_longest_name
  hash = game_hash
  count = longest_name_count
  hash.each do |loc, team|
    team.each do |k, v|
      if k == :players
        v.each do |player|
          return player[:player_name] if player[:player_name].length == count
        end
      end
    end
  end
end

def long_name_steals_a_ton
  hash = game_hash
  name = player_with_longest_name
  steals = most_steals
  hash.each do |loc, team|
    team.each do |k, v|
      if k == :players
        v.each do |player|
          return true if player[:player_name] == name && player[:steals] == steals
        end
      end
    end
  end
  return false
end

puts long_name_steals_a_ton