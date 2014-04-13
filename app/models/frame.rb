class Frame < ActiveRecord::Base
  include Tenpins

  belongs_to :game
  has_many :balls, dependent: :destroy

  validates :number, numericality: { only_integer: true, greater_than: 0, less_than: 11 }, allow_nil: true

  def calculate_points! score = nil
    total_points = score ? (self.points + score) : self.balls.sum(:pins)
    update_attribute(:points, total_points)
  end

  def tenth?
    self.number == 10
  end
end
