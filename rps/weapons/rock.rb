module Weapons
  class Rock < Base
    def name
      'rock'
    end

    private

    def beats
      'scissors'
    end
  end
end
