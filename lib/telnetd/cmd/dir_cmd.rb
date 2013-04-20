# Dir command implementation

class DirCmd

	# Handle the dir command. 
	# Shows the folder and files of the present working directory.
	# ==== Arguments
	# *+client+ The client to handle the command for
	# *+commandtime+ The command string content
	def handle(client, command)
		client.println("Dir is not implemented.")
	end

	# Describe the dir command
	def describe
		"Shows the folder and files of the present working directory."
	end

end