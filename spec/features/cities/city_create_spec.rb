# Feature: Create
#   As a user
#   I want to create city
feature 'Create', :devise do

  # Scenario: User cannot create city if not sign in
  #   Given I do not sign in
  #   When I try to create a new city
  #   Then I see a failure message
  scenario 'user cannot create if not registered' do
    visit new_city_path
    expect(page).to have_content I18n.t 'devise.failure.unauthenticated'
  end

  # Scenario: User can create city if authenticated
  #   Given I do not sign in
  #   When I try to create a new city
  #   Then I see a failure message
  scenario 'user can create city' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    visit new_city_path
    fill_in 'Name', :with => 'New York'
    click_button 'Create City'
    expect(page).to have_content 'City was successfully created.'
  end

  # Scenario: User cannot add duplicated city
  #   Given I exist as a user
  #   And I add second city with same name
  #   When I try to add second city
  #   Then I see an validation error message
  scenario 'user creates duplicate' do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:city, name: 'Duplicated')
    signin(user.email, user.password)
    visit new_city_path
    fill_in 'Name', :with => 'Duplicated'
    click_button 'Create City'
    expect(page).to have_content 'Name has already been taken'
  end


end
