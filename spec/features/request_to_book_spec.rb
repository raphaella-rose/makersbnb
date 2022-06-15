feature 'request to book' do 
  scenario 'a property' do
    visit 'property/privet-drive'
    click_button('Request to book')
    expect(page).to have_content 'Request confirmed!'
  end
end

