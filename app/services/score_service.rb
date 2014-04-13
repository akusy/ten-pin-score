class ScoreService

  def initialize game
    self.game = game
    self.preprevious_frame = nil #in case of double strike
    self.previous_frame = nil
  end

  def total_score_update
    @game.update_attribute(:total, @game.frames.sum(:points))
  end

  def update_score frame
    frame.calculate_points!
    update_previous frame
  end

  private
  attr_accessor :game, :last_frame, :preprevious_frame, :total_score, :previous_frame

  def double_strike?
    @preprevious_frame.try(:strike?) && @previous_frame.strike?
  end

  def update_previous frame
    first_pins = frame.balls.first.pins   

    @preprevious_frame.calculate_points!(first_pins) if double_strike?

    if @previous_frame.present?
      @previous_frame.calculate_points!(first_pins) if @previous_frame.spare?
      @previous_frame.calculate_points!(frame.points) if @previous_frame.strike?
    end
    replace_frames frame
  end

  def replace_frames frame
    @preprevious_frame = @previous_frame
    @previous_frame = frame
  end

end
