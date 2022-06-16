feature 'user can choose to login or sign up' do
  scenario 'unregistered user navigates to sign up page' do

    visit('/makersbnb/index')
    click_link('Sign Up')

    expect(page).to have_content 'Please enter your details to sign up!'
  end
end