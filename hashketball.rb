# Write your code here!
require "pry"

def game_hash
  game_hash =
  {
    home:
    {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players:
      {
        "Alan Anderson" =>
        {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" =>
        {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" =>
        {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" =>
        {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" =>
        {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away:
    {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players:
      {
        "Jeff Adrien" =>
        {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" =>
        {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" =>
        {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" =>
        {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" =>
        {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    #binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

#good_practices

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
            stats.each do |stat_type, number|
              if stat_type == :points
                return number
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
            stats.each do |stat_type, number|
              if stat_type == :shoe
                return number
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        if data == team
          return team_data[:colors]
        end
      end
    end
  end
end

def team_names
  teams = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        teams << data
      end
    end
  end
  teams
end

def player_numbers(team)
  jersey_numbers = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        if data == team
          game_hash[location][:players].each do |player, stats|
            jersey_numbers << stats[:number]
          end
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  big_shoe_player = ""
  big_shoe_size = 1
  big_shoe_total_rebounds = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if shoe_size(player) > big_shoe_size
            big_shoe_size = shoe_size(player)
            big_shoe_player = player
          end
        end
      end
    end
  end
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == big_shoe_player
            stats.each do |stat_type, number|
              if stat_type == :rebounds
                return number
              end
            end
          end
        end
      end
    end
  end
end
