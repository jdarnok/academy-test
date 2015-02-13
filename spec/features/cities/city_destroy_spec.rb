# Feature: Create
#   As a user
#   I want to create city
feature 'Destroy', :devise do

  # Scenario: User cannot create city if not sign in
  #   Given I am signed in
  #   When I try to delete city
  #   Then I see a success message
  scenario 'user destroy city' do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:city)
    signin(user.email, user.password)
    visit cities_path
    click_link 'Destroy'
    expect(page).to have_content 'City was successfully destroyed.'
  end


end
