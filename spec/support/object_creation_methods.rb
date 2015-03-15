def create_user(options={})
  defaults = {username: "Darth Vader", password: "i am your father"}

  User.create!(defaults.merge(options))
end

def create_doctor(options={})
  defaults = {name: "Dr. Evil"}

  Doctor.create!(defaults.merge(options))
end
