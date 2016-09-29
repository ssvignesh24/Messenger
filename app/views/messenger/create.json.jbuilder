if @token.nil?
	json.status false
else
	json.status true
	json.token @token
end