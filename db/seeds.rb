3.times{
  User.create({
      name: Faker::Book.title,
      password: Faker::Book.title,
      email: Faker::Book.title
    })
}
