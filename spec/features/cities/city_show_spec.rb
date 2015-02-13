include Warden::Test::Helpers
Warden.test_mode!

# Feature: User profile page
#   As a user
#   I want to visit my user profile page
#   So I can see my personal account data
feature 'User profile page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User sees own profile
  #   Given I am signed in
  #   When I visit the cities page
  #   Then I see all cities
  scenario 'user sees cities' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit cities_path
    expect(page).to have_content 'Cities'
  end

  # Scenario: unauthorized user cannot see cities
  #   Given I am not signed in
  #   When I visit cities page
  #   Then I see an 'access denied' message
  scenario "unauthorized user cannot see cities" do
    visit cities_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

end
