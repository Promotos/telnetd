
module Telnetd
# Handle the cd command with the one argument passed
class CdCmd

	# Handle the cd command. 
	# Shows the folder and files of the present working directory.
	# ==== Arguments
	# *+client+ The client to handle the command for
	# *+command+ The command string content
	def handle(client, command)
		args = command.split(' ')
		if(args.length == 2)
			client.println(cd(client.context, args[1]))
		else
			client.println("Missing the folder name argument.")
		end
	end

	# Execute the cd command against the client context.
	# ==== Argument
	# *+context+ The client context to execute the cd command on.
	# *+arg+ The argument with the requested path to be changed. 
	def cd(context, arg)
		context.cd(arg)
	end

	# Describe the dir command
	def describe
		"Change the working directory with the passed argument. Use '..' to navigate upwards."
	end
end
end