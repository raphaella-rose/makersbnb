feature "my_listings page" do
  scenario "the view more details page takes you to the properties page" do
    log_in
    visit '/makersbnb/my_listings' #delete this line after raphaella's refactoring
    click_button('View more details')
    expect(page).to have_content "Privet Drive"
  end
  scenario "a property is added, user clicks on property on my listing page, recieves description" do
    log_in
    visit '/makersbnb/add' 
    fill_in 'property_title', with: "Paddys house"
    fill_in 'description', with: "the nicest place in all of london"
    fill_in 'price_per_night', with: 2000
    click_button('Submit')
    find_by_id("Paddy's house").click
    expect(page).to have_content "the nicest place in all of london"
  end


  #test3 multiple properties added and visited
end


  # fill_in 'property_title', with: "Privet Drive"
    # fill_in 'description', with: "Harry Potter's original casa"
    # fill_in 'price_per_night', with: 156