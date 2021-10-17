puts '~> Create users'

admin = User.create(email: 'admin@goonrails.com', password: 'password123')
admin.add_role(:admin)

user = User.create(email: 'user@goonrails.com', password: 'password123')
user.add_role(:user)
