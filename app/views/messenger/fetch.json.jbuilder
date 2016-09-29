if @messages.empty?
	json.status false
else
	json.status true

	json.messages @messages do |message|
		json.message message.message
		json.from message.from.id
		json.time message.created_at
	end
end