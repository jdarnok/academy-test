describe City do
  let (:city) {FactoryGirl.build(:city)}
  it "is valid with name and short_name" do
  expect(city).to be_valid
  end
  it "returns short_name as a string" do
    city.valid?
    expect(city.short_name).to eq 'Mg'
  end
end
