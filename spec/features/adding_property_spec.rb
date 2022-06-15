
feature 'adding page' do
  scenario 'seeing the welcome page message' do
    visit '/makersbnb/add'

    expect(page).to have_content 'Hello user! would you like to list your property?'
    expect(page).to have_content 'fill in your details below:'
  end

  scenario 'adding a property' do
    visit '/makersbnb/add'
    fill_in 'property_title', with: 'buckingham palace'
    fill_in 'description', with: 'queens house init?'
    fill_in 'price_per_night', with: 400
    click_button 'Submit'
    visit '/makersbnb/my_listings'

    expect(page).to have_content 'buckingham palace'
    expect(page).to have_content 'queens house init?'
    expect(page).to have_content 400
  end
end

