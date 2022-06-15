require 'user'
require 'database_helpers'

describe '.create' do
  it 'creates a new user' do
    user = User.create(email: 'test@example.com', password: 'password123')
    
    persisted_data = persisted_data(id: user.id, table: 'users')
    expect(user).to be_a User
    expect(user.id).to eq persisted_data[id: 43]
    expect(user.email).to eq 'test@example.com'
  end
end