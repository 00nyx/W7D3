require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #index' do
    it "renders the index page" do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    it "renders the new page" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    it "adds the user to the database" do
      user = FactoryBot.build(:user)
      get :create, params: { user: { username: user.username, password: user.password } }
      
      expect(response).to redirect_to(user_url(User.last))
    end
  end

  describe 'GET #show' do
    it "shows the user's page" do
      user = FactoryBot.create(:user)
      get :show, params: {id: user.id}

      expect(response).to render_template('show')
    end
  end


end
