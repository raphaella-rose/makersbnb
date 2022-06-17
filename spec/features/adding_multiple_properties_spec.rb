require_relative './web_helpers'

feature 'adding page' do
    scenario 'seeing the welcome page message' do
      sign_up()
      click_link "Add property"
  
      expect(page).to have_content 'Hello user! would you like to list your property?'
      expect(page).to have_content 'fill in your details below:'
    end
  
    scenario 'adding multiple properties' do 

      sign_up()
      click_link "Add property"
      
      fill_in 'property_title', with: 'buckingham palace'
      fill_in 'description', with: 'queens house init?'
      fill_in 'price_per_night', with: 400

      click_button 'Submit'
      visit '/makersbnb/add'

      fill_in 'property_title', with: 'jamaica'
      fill_in 'description', with: 'sunny'
      fill_in 'price_per_night', with: 300
    
      click_button 'Submit'
      visit '/makersbnb/my_listings'
  
      expect(page).to have_content 'jamaica'
      expect(page).to have_content 'sunny'
      expect(page).to have_content 300
      expect(page).to have_content 'buckingham palace'
      expect(page).to have_content 'queens house init?'
      expect(page).to have_content 400
    end 
  end
  
  