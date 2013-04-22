
module Telnetd
# Help command is used to display all available commands with a one line description
class HelpCmd

	# Used to show all available commands to the client
	# ==== Arguments
	# *+client+ The client to handle the command for
	# *+command+ The command string content
	def handle(client, command)
		client.command_registry.commands.each { |name,cmd| 
			client.println("#{name} \t #{cmd.describe}") 
		}
		#client.println("#{client.command_registry}")
	end

	# Describe the help command
	def describe
		"Show the list of all available commands."
	end
end
end