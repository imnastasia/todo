user_one = User.find_or_initialize_by(email_address: 'user1@example.com')
user_one.update(password: '123Qwe123')
user_two = User.find_or_initialize_by(email_address: 'user1@example.com')
user_two.update(password: '123Qwe123')

List.create(name: 'Routine', user: user_one)
List.create(name: 'Dreams', user: user_one)

List.create(name: 'Routine', user: user_two)
