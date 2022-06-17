require_relative './web_helpers'

feature 'all properties listed on site shows on homepage' do
  scenario 'user signs up/logs in all listings show' do
    sign_up_user_1()
    click_link 'Add property'
    fill_in 'property_title', with: 'buckingham palace'
    fill_in 'description', with: 'queens house init?'
    fill_in 'price_per_night', with: 400

    click_button 'Submit'
    click_link 'Return to homepage'
    click_link 'Sign out'

    sign_up_user_2()
    click_link 'Add property'
    fill_in 'property_title', with: 'jamaica'
    fill_in 'description', with: 'sunny'
    fill_in 'price_per_night', with: 300
    
    click_button 'Submit'
    click_link 'Return to homepage'

    expect(page).to have_content 'jamaica'
    expect(page).to have_content 'sunny'
    expect(page).to have_content 300
    expect(page).to have_content 'buckingham palace'
    expect(page).to have_content 'queens house init?'
    expect(page).to have_content 400
  end
end