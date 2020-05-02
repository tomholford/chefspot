module Weapons
  class Base
    def beats?(weapon)
      weapon.name == beats
    end

    private

    def beats
      raise NotImplementedError, 'Implement in subclass'
    end
  end
end
