def create_user(options={})
  defaults = {username: "Darth Vader", password: "i am your father"}

  User.create!(defaults.merge(options))
end
