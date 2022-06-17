require_relative './web_helpers'

feature 'adding page' do
  scenario 'seeing the welcome page message' do
    sign_up_user_1()
    click_on 'Add property'
     
    expect(page).to have_content 'Hello user! would you like to list your property?'
    expect(page).to have_content 'fill in your details below:'
  end

  scenario 'adding a property' do
    sign_up_user_1()
    click_on 'Add property'

    fill_in 'property_title', with: 'buckingham palace'
    fill_in 'description', with: 'queens house init?'

    fill_in 'price_per_night', with: 400
    click_button 'Submit'

    expect(page).to have_content 'buckingham palace'
    expect(page).to have_content 'queens house init?'
    expect(page).to have_content 400
  end
end

