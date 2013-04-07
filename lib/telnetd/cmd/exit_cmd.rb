# Exit command used to close a client connection

class ExitCmd

	# Handle the exit command by closing the client connection.
	# Send the bye message to the client before closing the socket.
	# ==== Arguments
	# *+client+ The client to handle the command for
	# *+command+ The command string content
	def handle(client, command)
		client.close()
	end

end