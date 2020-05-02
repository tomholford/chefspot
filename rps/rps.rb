require_relative 'rps_client'
require_relative 'weapon'
require_relative 'weapons/base'
require_relative 'weapons/rock'
require_relative 'weapons/paper'
require_relative 'weapons/scissors'

class RPS
  DEFAULT_SVC_URL = 'https://nh-a811fa16.herokuapp.com/'.freeze
  MOVE_MAP = { 1 => 'rock', 2 => 'paper', 3 => 'scissors' }.freeze

  attr_reader :rounds

  def self.main
    new.main
  end

  def initialize
    @rounds = ARGV.first.to_i
  end

  def main
    current_round = 0
    wins = 0

    while current_round < rounds
      current_round += 1
      current_player_weapon = Weapon.from_move(get_player_move)
      current_server_weapon = Weapon.from_move(get_server_move)
      puts "Server: #{current_server_weapon.name}"
      puts "Player: #{current_player_weapon.name}"

      wins += 1 if current_player_weapon.beats?(current_server_weapon)
    end

    puts "You won #{wins} out of #{rounds} rounds."
    puts "You #{wins > rounds / 2 ? 'win' : 'lose'}."
  end

  private

  def get_player_move
    valid = false
    move = nil

    until valid
      puts 'Your move? (1 for rock, 2 for paper, 3 for scissors)'
      move = $stdin.gets.chomp
      valid = %w[1 2 3].include?(move.strip)
    end

    MOVE_MAP[move.to_i]
  end

  def get_server_move
    client.next_weapon
  end

  def client
    @client ||= RPSClient.new(url: DEFAULT_SVC_URL)
  end
end

RPS.main
