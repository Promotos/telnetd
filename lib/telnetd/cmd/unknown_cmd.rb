# Handle an unknown command

class UnknownCmd

	# Handle an unknown command by echo the provided command with a string that
	# the command is unknown and also a help message the get a list of all
	# available commands
	# ==== Arguments
	# *+client+ The client to handle the command for
	# *+command+ The command string content
	def handle(client, command)
		client.println("Unknown command \"#{command}\"")
		client.println("Type \"help\" for a full list of available commands.")
	end

end