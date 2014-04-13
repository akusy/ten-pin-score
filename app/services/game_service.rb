class GameService

  def initialize game
    self.game = game
    self.score_service = ScoreService.new(@game)
  end

  def start
    10.times do |i|
      frame = @game.frames.create(number: i+1)
      throw_ball frame
      play_tenth_frame(frame.reload) if frame.tenth?
      @score_service.update_score frame.reload
    end
    @score_service.total_score_update
  end

  private
  attr_accessor :game, :score_service

  def throw_ball frame, number = 2
    number.times do |i|
      ball = frame.balls.create(pins: rand(11), number: i+1)
      break if finish?(ball)
    end
  end

  def finish? ball
    (ball.strike? || ball.spare?) && !ball.frame.tenth?
  end

  def play_tenth_frame frame
    throw_ball(frame, 1) unless frame.regular?
  end

end
