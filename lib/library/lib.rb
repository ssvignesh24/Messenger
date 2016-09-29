def rand_string(length = 15)
  rand(36**length).to_s(36)
end

def secret key
  Rails.application.secrets[key]
end

def generate_token
  rand_string 40
end

class MessageException < StandardError
  attr_reader :error_code, :reason
  def initialize reason = "Cant create message", error_code = 0
    @reason = "Message: " + reason
    @error_code = error_code
    super @reason
  end
end