module GamesHelper

  def render_ball ball
    result = case ball.knock 
    when Ball::TYPES[:strike] then
      "<span class='badge'>STRIKE!</span>"
    when Ball::TYPES[:spare] then
      "<span class='badge'>SPARE!</span>"
    else
      nil
    end
    raw"#{ball.pins} #{result}"
  end
end
