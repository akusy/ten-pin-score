module Tenpins

  TYPES = {
    regular: 1,
    strike:  2,
    spare:   3
  }.freeze

  def strike?
    self.knock == TYPES[:strike]
  end

  def spare?
    self.knock == TYPES[:spare]
  end

  def regular?
    self.knock == TYPES[:regular]
  end
end
