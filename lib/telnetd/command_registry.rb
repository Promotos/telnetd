# Command Registry used to collect and manage the build in commands
# for the telnetd

require 'telnetd/cmd/unknown_cmd'
require 'telnetd/cmd/exit_cmd'

class CommandRegistry

	# Create a new instance of the command registry.
	def initialize
		@commands = { "exit" => ExitCmd.new }
	end

	# Handle a client command by selection the command from
	# the registry and execute its instance.
	# ==== Arguments
	# *+client+ The client to execute the command for
	# *+command+ The command to be executed
	def handle(client, command)
		command.strip!
		if @commands.has_key? command
			@commands[command].handle(client, command)
		else
			handle_unknown_command(client, command)
		end
	end

private
	def handle_unknown_command(client, command)
		UnknownCmd.new.handle(client, command)
	end

end