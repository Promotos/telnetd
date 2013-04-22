require 'fileutils'

module Telnetd
#Touch command implementation
class TouchCmd

	# Handle the touch command.
	# Create a new empty file with the given file name
	# ==== Arguments
	# *+client+ The client to handle the command for
	# *+commandtime+ The command string content
	def handle(client, command)
		args = command.split(' ')
		if(args.length == 2)
			FileUtils.cd(client.context.path) do
				FileUtils.touch(args[1])	
			end
		else
			client.println("Missing filename.")
		end
	end

	# Describe the uptime command
	def describe
		"Create a new file with the new name provided as argument."
	end

end
end