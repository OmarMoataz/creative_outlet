# frozen_string_literal: true

module Helpers
  def log_in_as(user)
    post '/login', params: { email: user.email, password: user.password }
    JSON.parse(response.body)['token']
  end
end
