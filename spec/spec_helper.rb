require 'bundler/setup'
Bundler.require(:default, :test)
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['test'])

RSpec.configure do |config|
  config.after(:each) do
    Player.all.each { |player| player.destroy }
    Game.all.each { |game| game.destroy }
    Result.all.each { |result| result.destroy }
    League.all.each { |league| league.destroy }
  end
end
