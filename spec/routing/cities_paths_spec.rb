

describe 'routing to cities' do

  it 'routes /cities/new to city#new' do
    expect(:get => "/cities/new").to route_to(:controller => "cities", :action => "new")
  end
  it 'routes /cities/:id to city#show for id' do
    expect(:get => "/cities/1").to route_to(:controller => "cities", :action => "show", :id => "1")
  end

end