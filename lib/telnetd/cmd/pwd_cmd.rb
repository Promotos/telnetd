
module Telnetd
# Shows the present working directory to the client
class PwdCmd

	# Handle the uptime command. Shows the connection time span in seconds.
	# ==== Arguments
	# *+client+ The client to handle the command for
	# *+commandtime+ The command string content
	def handle(client, command)
		client.println("#{client.context.path}")
	end

	# Describe the uptime command
	def describe
		"Show the present working directory."
	end
end
end