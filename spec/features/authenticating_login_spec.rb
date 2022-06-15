feature 'authentication' do
  scenario 'registered user enters login details' do

    User.create(email: 'test@example.com', password: 'password123')

    visit('/users/login')
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, test@example.com'


  end
end