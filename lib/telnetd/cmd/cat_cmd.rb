
module Telnetd
# Cat command implementation
class CatCmd

	# Handle the touch command.
	# Create a new empty file with the given file name
	# ==== Arguments
	# *+client+ The client to handle the command for
	# *+commandtime+ The command string content
	def handle(client, command)
		args = command.split(' ')
		if(args.length == 2)
		#	FileUtils.cd(client.context.path) do
		#		FileUtils.touch(args[1])	
		#	end
			begin
				file = File.new("#{client.context.path}/#{args[1]}", "r")
				while (line = file.gets)
					line = line.gsub("\n", "\r\n")
					client.print("#{line}")
				end
				file.close

		    	#client.println(File.read("#{client.context.path}/#{args[1]}"))
			rescue => err
				client.println(err)
			end
		else
			client.println("Missing filename.")
		end
	end

	# Describe the uptime command
	def describe
		"Print the content of the file to the client"
	end
end
end
