require 'spec_helper'

describe ScoreService do
  let(:game) { Fabricate(:game) }

  describe "#update_score" do
    let!(:frame1) { Fabricate(:frame, game: game, points: 0) }
    let!(:frame2) { Fabricate(:frame, game: game, points: 0) }
    let!(:ball1) { Fabricate(:ball, frame: frame1, pins: 5) }
    let!(:ball2) { Fabricate(:ball, frame: frame2, pins: 8) }

    subject { described_class.new(game) }

    before { subject.instance_variable_set(:@previous_frame, frame1) }

    context "when regular balls" do
      before { subject.update_score frame2 }

      it "updates points in current frame" do
        expect(frame2.points).to eq 8
      end
    end

    context "when strike ball" do
      before do
        ball1.update_attributes(frame: frame1, pins: 10, knock: Ball::TYPES[:strike])
        ball2.update_attributes(frame: frame2, pins: 8)
        frame1.update_attributes(points: 10)
        subject.update_score frame2 
      end

      it "updates points in current frame" do
        expect(frame2.points).to eq 8
      end

      it "updates points in previous frame" do
        expect(frame1.points).to eq 18
      end
    end

    context "when double strike" do
      let!(:frame0) { Fabricate(:frame, game: game, points: 20, knock: Ball::TYPES[:strike]) }
      before do
        ball1.update_attributes(frame: frame1, pins: 10, knock: Ball::TYPES[:strike])
        ball2.update_attributes(frame: frame2, pins: 8)
        frame1.update_attributes(points: 10, knock: Ball::TYPES[:strike])
        subject.instance_variable_set(:@preprevious_frame, frame0)
        subject.update_score frame2 
      end

      it "updates points in current frame" do
        expect(frame2.points).to eq 8
      end

      it "updates points in previous frame" do
        expect(frame1.points).to eq 18
      end

      it "updates points in preprevious frame" do
        expect(frame0.points).to eq 28
      end
    end
  end

  describe "#total_score_update" do
    let(:game) { Fabricate(:game) }
    let!(:frame1) { Fabricate(:frame, game: game, points: 10) }
    let!(:frame2) { Fabricate(:frame, game: game, points: 9) }
    let!(:frame3) { Fabricate(:frame, game: game, points: 12) }

    subject { described_class.new(game) }

    it "updates game total" do
      subject.total_score_update
      expect(game.total).to eq 31
    end
  end
end
