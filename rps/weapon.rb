class Weapon
  def self.from_move(move)
    Kernel.const_get("Weapons::#{move.capitalize}").new
  end
end
