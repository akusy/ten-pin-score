require 'spec_helper'

describe GamesController do

 describe "GET #index" do
    it "renders the :index view" do
      get :index
      expect(response.status).to eq 200
      expect(response).to render_template :index
    end
  end

  describe "POST #create" do 
    it "creates a new game" do 
      expect{ post :create, query: Fabricate.attributes_for(:game) }.to change(Game, :count).by(1) 
    end 

    it "redirects to the new game" do 
      post :create, query: Fabricate.attributes_for(:game)
      expect(response).to redirect_to Game.last 
    end
  end

  describe "GET #show" do
    let(:game){ Fabricate(:game) } 
    let(:frame){ Fabricate(:frame, game: game) }
    
    before { get :show, id: game.id }

    it "renders show template" do
      expect(response.status).to eq 200
      expect(response).to render_template :show
    end
    
    it "assigns the @game" do 
      expect(assigns(:game)).to eq game
    end

    it "assigns the @frames" do 
      expect(assigns(:frames)).to eq [frame]
    end
  end
end
