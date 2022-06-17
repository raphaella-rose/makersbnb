
def log_in
  visit '/makersbnb/index'
  click_link('Log in')
  fill_in(:email, with: 'test@example.com')
  fill_in(:password, with: 'password123')
  click_button('Sign in')
end

def sign_up 
  visit '/makersbnb/index'
  click_link('Sign Up')
  fill_in(:email, with: 'test@example.com')
  fill_in(:password, with: 'password123')
  click_button('Submit')

end