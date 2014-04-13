require 'spec_helper'

describe GameService do
  let(:game) { Fabricate(:game) }

  describe "#start" do
    subject { described_class.new(game) }

    it "creates ten frames" do
      subject.start
      expect(game).to have(10).frames
    end

    context "When tenth frame is a strike" do
      before do 
        Ball.any_instance.stub(:knock).and_return(Ball::TYPES[:strike])
        subject.start
      end
    
      it "has one ball in first frames" do
        expect(game.frames.first).to have(1).balls
      end

      it "has three balls in tenth frames" do
        expect(game.frames.last).to have(3).balls
      end
    end

    context "When tenth frame is a spare" do
      before do 
        Frame.any_instance.stub(:knock).and_return(Frame::TYPES[:spare])
        subject.stub(:finish?).and_return(false)
        subject.start
      end
    
      it "has one ball in first frames" do
        expect(game.frames.first).to have(2).balls
      end

      it "has three balls in tenth frames" do
        expect(game.frames.last).to have(3).balls
      end
    end
  end

end
