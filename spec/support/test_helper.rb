module Helpers
  def log_in_as(user)
    post '/login', params: { session: { email: user.email, password: user.password }}
  end
end