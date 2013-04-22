
module Telnetd
# Uptime command to show the client connection time
class UptimeCmd

	# Handle the uptime command. Shows the connection time span in seconds.
	# ==== Arguments
	# *+client+ The client to handle the command for
	# *+commandtime+ The command string content
	def handle(client, command)
		time = (Time.now - client.context.start_time).to_i;
		hours = time/3600.to_i
		minutes = (time/60 - hours * 60).to_i
		seconds = (time - (minutes * 60 + hours * 3600))
		client.println("Client connected since %02d:%02d:%02d [hh:mm:ss]" % [hours, minutes, seconds])
	end

	# Describe the uptime command
	def describe
		"Show the client connection uptime."
	end
end
end