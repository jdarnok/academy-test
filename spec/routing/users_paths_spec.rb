describe 'routing to index' do
  it 'routes /all_users to users#index' do
    expect(:get => "/all_users").to route_to(:controller => "users", :action => "index")
  end
end