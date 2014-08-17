require 'bundler/setup'
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
  puts "
 _____                        _
|  __ \                      | |
| |  \/ __ _ _ __ ___   ___  | |     ___  __ _  __ _ _   _  ___
| | __ / _` | '_ ` _ \ / _ \ | |    / _ \/ _` |/ _` | | | |/ _ \
| |_\ \ (_| | | | | | |  __/ | |___|  __/ (_| | (_| | |_| |  __/
 \____/\__,_|_| |_| |_|\___| \_____/\___|\__,_|\__, |\__,_|\___|
                                                __/ |
                                               |___/
  "
end

def underline
  puts "******************"
end

space = "          "

def main_menu
  clear
  puts "        A > Add league \n
        D > Delete league \n
        L > Access Leagues \n"

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
  else
    main_menu
  end
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

main_menu
