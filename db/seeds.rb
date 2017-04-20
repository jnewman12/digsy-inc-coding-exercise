# spin up some objects

# generate agent actions
actions = ['Give a call', 'Go out for coffee', 'Follow up', 'speak to decision maker',
'take out to lunch', 'go golfing with client', 'cold call', 'answer emails']

25.times do
  AgentAction.create(
    image_link: Faker::Avatar.image,
    title: actions.sample,
    performed: false,
    ignored: false
  )
end

# generate sole admin user
AdminUser.create(email: 'test@email.com', password: 'password', password_confirmation: 'password')

# generate sole user
User.create(email: 'test@somemail.com', name: 'James', password: 'password', password_confirmation: 'password')