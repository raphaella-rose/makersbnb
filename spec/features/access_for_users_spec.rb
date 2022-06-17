feature 'registered user access' do
  scenario 'unregistered users cannot view listing page' do
    visit('/makersbnb/my_listings')

    expect(page).to have_content 'Please log in to access this page.'
  end

  scenario 'unregistered users cannot view add page' do
    visit('/makersbnb/add')

    expect(page).to have_content 'Please log in to access this page.'
  end
end