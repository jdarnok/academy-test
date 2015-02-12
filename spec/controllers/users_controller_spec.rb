describe UsersController do

  describe 'GET #index' do
    it 'renders index template' do
      sign_in FactoryGirl.create(:user)
      get :index
      expect(response).to render_template :index
    end
    it "has a 200 status code" do
      sign_in FactoryGirl.create(:user)
      get :index
      expect(response.status).to eq(200)
    end
  end
end