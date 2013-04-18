# Uptime command to show the client connection time
class UptimeCmd

	# Handle the uptime command. Shows the connection time span in seconds.
	# ==== Arguments
	# *+client+ The client to handle the command for
	# *+commandtime+ The command string content
	def handle(client, command)
		seconds = Time.now - client.context.start_time;
		client.println("#{ seconds.to_i } seconds connected")
	end

	# Describe the uptime command
	def describe
		"Show the client connection uptime."
	end
end