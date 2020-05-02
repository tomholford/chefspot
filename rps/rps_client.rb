require 'json'
require 'net/http'
require 'uri'

class RPSClient
  attr_reader :url

  def initialize(url:)
    @url = url
  end

  def next_weapon
    response = Net::HTTP.get_response(uri)

    JSON.parse(response.body)['weapon']
  end

  private

  def uri
    @uri ||= URI.parse(url)
  end
end
