require_relative './web_helpers'

feature 'authentication' do
  scenario 'registered user enters login details' do

    User.create(email: 'test@example.com', password: 'password123')

    log_in()

    expect(page).to have_content 'Book a Space'

  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(email: 'test@example.com', password: 'password123')

    visit '/makersbnb/index'
    click_link('Log in')
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Book a Space'
    expect(page).to have_content 'Please check your email or password'

  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(email: 'test@example.com', password: 'password123')

    visit '/makersbnb/index'
    click_link('Log in')
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Book a Space'
    expect(page).to have_content 'Please check your email or password.'

  end

  scenario 'a user can sign out' do
    User.create(email: 'test@example.com', password: 'password123')

    log_in()

    click_link('Sign out')

    expect(page).not_to have_content 'Book a Space'
    expect(page).to have_content 'You have signed out.'
  end
end

