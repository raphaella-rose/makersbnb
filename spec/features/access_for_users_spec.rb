feature 'registered user access' do

  scenario 'unregistered users cannot view add page' do
    visit('/spaces/new')

    expect(page).to have_content 'Please log in to access this page.'
  end
end