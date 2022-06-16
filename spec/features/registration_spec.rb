feature 'registration' do
  scenario 'a user can sign up' do
    visit '/makersbnb/index'
    click_link('Sign Up')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
    
    expect(page).to have_content "Welcome, test@example.com"
  end

  

end
