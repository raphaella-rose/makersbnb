feature 'user can choose to login or sign up' do
  scenario 'unregistered user navigates to sign up page' do

    visit('/makersbnb/index')

    expect(page).to have_content 'Please enter your details to sign up!'
  end

  scenario 'registered user navigates to log in page' do

    visit('/makersbnb/index')
    click_link('Log in')

    expect(page).to have_content 'Login here:'
  end
end