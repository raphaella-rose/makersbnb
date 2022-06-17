
def log_in
  visit '/makersbnb/index'
  click_link('Log in')
  fill_in(:email, with: 'test@example.com')
  fill_in(:password, with: 'password123')
  click_button('Sign in')
end

def sign_up_user_1 
  visit '/makersbnb/index'
  fill_in(:email, with: 'test1@example.com')
  fill_in(:password, with: 'password123')
  click_button('Submit')
end

def sign_up_user_2
  visit '/makersbnb/index'
  fill_in(:email, with: 'test2@example.com')
  fill_in(:password, with: 'password123')
  click_button('Submit')
end