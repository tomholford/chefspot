module Weapons
  class Scissors < Base
    def name
      'scissors'
    end

    private

    def beats
      'paper'
    end
  end
end
