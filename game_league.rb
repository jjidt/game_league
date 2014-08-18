require 'bundler/setup'
require 'pry'
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/./lib/*.rb'].each { |file| require file }

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['development'])

def clear
  system('clear')
end

def prompt(question)
  puts question
  gets.chomp
end

def ws
  puts ""
end

def title
  print  "_____                        _
|  __ \                      | |
| |  \/ __ _ _ __ ___   ___  | |     ___  __ _  __ _ _   _  ___
| | __ / _` | '_ ` _ \ / _ \ | |    / _ \/ _` |/ _` | | | |/ _ \
| |_\ \ (_| | | | | | |  __/ | |___|  __/ (_| | (_| | |_| |  __/
 \____/\__,_|_| |_| |_|\___| \_____/\___|\__,_|\__, |\__,_|\___|
                                                __/ |
                                               |___/"
end

def underline
  puts "******************"
end

space = "          "

def main_menu
  clear
  puts "        A > Add league \n
        D > Delete league \n
        L > Access Leagues \n
        E > Exit"

  case gets.chomp.downcase
  when "a"
    clear
    list_leagues
    name = prompt("What is the name of your league?")
    new_league = League.new(:name => name)
    if new_league.save
      ws
      ws
      puts "#{name} added to the league board"
    else
      ws
      ws
      puts "name not available"
      sleep 2
    end
    clear
    list_leagues
    sleep 2
    main_menu
  when "d"
    clear
    list_leagues
    delete = prompt("enter name of league to delete")
    League.where(:name => delete).destroy_all
    clear
    list_leagues
    sleep 2
    main_menu
  when "l"
    clear
    list_leagues
    league_name = prompt("enter name of league to access")
    if League.where(:name => league_name).first
      selected_league = League.where(:name => league_name).first
      player_menu(selected_league)
    else
      clear
      main_menu
    end
  when "e"
    exit
  else
    main_menu
  end
end

def player_menu(league)
  clear
  puts league.name + "League Menu"
  ws
  puts "        AP > Add player\n
        RS > Report score\n
        LP > Access players\n
        SG > Show game history\n
        E > Exit to main menu"

  case gets.chomp.downcase
  when "ap"
    clear
    list_players
    name = prompt("What is the name of the player?")
    new_player = Player.new(:name => name)
    if new_player.save
      ws
      ws
      puts "#{name} added to the roster"
    else
      ws
      ws
      puts "name not available"
      sleep 2
    end
    clear
    list_players
    sleep 2
    player_menu(league)
  when 'rs'
    list_players
    player1_name = prompt("player #1's name?")
    player1_score = prompt("player #1's score?").to_i
    player2_name = prompt("player #2's name?")
    player2_score = prompt("player #2's score?").to_i
    player1 = Player.where(:name => player1_name).first
    player2 = Player.where(:name => player2_name).first
    new_game = Game.create(:league_id => league.id)
    if player1 && player2
      result1 = Result.new(:player_id => player1.id, :game_id => new_game.id, :score => player1_score)
      result2 = Result.new(:player_id => player2.id, :game_id => new_game.id, :score => player2_score)
    else
      clear
      ws
      ws
      ws
      puts "invalid player input"
      ws
      ws
      sleep 2
      player_menu(league)
    end
    if result1.save && result2.save
      clear
      ws
      ws
      ws
      puts "game result added"
      ws
      ws
      sleep 2
    else
      clear
      ws
      ws
      ws
      puts "invalid score input, must be between 0 and 21"
      ws
      ws
      sleep 2
    end
    player_menu(league)
  when 'lp'
    clear
    list_players
    player_choice = prompt("see which players accomplishments?")
    if Player.where(:name => player_choice) && player_choice !=""
      player = Player.where(:name => player_choice).first
      puts "#{player.name}:   victories"
      list_games(player)
    end
    prompt("press enter to return to menu")
    clear
    player_menu(league)
  when 'e'
    main_menu
  else player_menu(league)
  end
  player_menu(league)
end


def list_leagues
  leagues = League.all
  ws
  leagues.each do |league|
    puts "* #{league.name}"
    underline
  end
  ws
end

def list_players
  players = Player.all
  ws
  players.each do |player|
    puts "* #{player.name}"
    underline
  end
  ws
end

def list_games(player)
  player.games.each do |game|
    puts "Game # #{game.id}"
  end
end

main_menu
