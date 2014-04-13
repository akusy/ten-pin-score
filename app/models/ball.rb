class Ball < ActiveRecord::Base
  include Tenpins

  belongs_to :frame

  after_save :update_frame
  after_create :update_ball

  validates :number, numericality: { only_integer: true, greater_than: 0, less_than: 4 }, allow_nil: true

  private

  def update_ball
    self.update_attribute(:knock, TYPES[:strike]) if self.pins == 10 && self.number == 1
    self.update_attribute(:knock, TYPES[:spare]) if self.pins == 10 && self.number == 2
  end

  def update_frame
    self.frame.update_attribute(:knock, self.knock) if self.frame.regular? && !self.regular?
  end
end
