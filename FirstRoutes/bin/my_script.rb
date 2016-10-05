  # We'll be using this to make requests to our Rails app.
  # We'll be able to run this script with the ruby command.
  require 'addressable/uri'
  require 'rest-client'

  def index_users
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: '/users.json'
    ).to_s

    puts RestClient.get(url)
  end

  def create_user
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: '/users.json'
    ).to_s

    puts RestClient.post(
      url,
      { user: { username: "username"} }
    )
  end

  def create_contact
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: '/users/2/contacts'
    ).to_s

    puts RestClient.post(
      url,
      { contact: { name: "Gemini", email: "gemini@gmail.com", user_id: 2} }
    )
  end

  create_contact
    # we've namespaced all the parameters of the user to create under :user.
    # This leverages mass-assignment to set all the uploaded attributes.
    # This is an extremely common Rails pattern: pretty much every time we
    # upload parameters we will nest them under in an inner hash to use for mass assignment.
