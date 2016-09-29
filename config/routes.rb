Rails.application.routes.draw do
  
  scope :api do
  	scope :v0 do
  		post "create" => "messenger#create"
  		post "send" => "messenger#send_message"
  		get "fetch" => "messenger#fetch"
  	end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
