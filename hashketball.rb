def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
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
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
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

def get_all_players
	all_players = game_hash[:home][:players].merge(game_hash[:away][:players])
	
end

def num_points_scored(player_name)
	get_all_players[player_name][:points]
end

def shoe_size(player_name)
	get_all_players[player_name][:shoe]
end

def get_all_teams
	all_teams = game_hash[:home].merge(game_hash[:away])
end

def team_colors(team_input)
	color_array = []
	game_hash.map do |key,value|
		#puts [:colors]
		if value[:team_name] == team_input
			color_array << value[:colors]
		end
	end
	color_array.flatten
end

def team_names
	#names = game_hash[:home][:team_name].merge(game_hash[:away][:team_name])	
	names = []
	names << game_hash[:home][:team_name]
	names << game_hash[:away][:team_name]
end

def player_numbers(team_input)
	num_array = []
	game_hash.map do |key,value|
		if value[:team_name] == team_input
			value.map do |key2, stats|
				if key2 == :players
					stats.map do |name,values|
						num_array << values[:number]
					end
				end
			end
		end
	end
	num_array
end

def player_stats(player_name)
	my_player = []
	my_stats = []
	my_hash = {}
	game_hash.map do |outerkey,outerval|
		outerval[:players].map do |key,value|
			if key == player_name
				my_hash[key] = value
			end
		end
	end
	my_hash[player_name]
end

def big_shoe_rebounds
	biggest_shoe = []
	rebound_count = 0
	game_hash.map do |outerkey,outerval|
		outerval[:players].map do |player,stats|
			biggest_shoe << stats[:shoe]
		end
	end
	shoe_size = biggest_shoe.sort.reverse[0]
	
	game_hash.map do |outerkey,outerval|
		outerval[:players].map do |player,stats|
			if stats[:shoe] == shoe_size
				rebound_count = stats[:rebounds]
			end
		end
	end
	rebound_count
end