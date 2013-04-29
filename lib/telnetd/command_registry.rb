require 'telnetd/cmd/unknown_cmd'
require 'telnetd/cmd/exit_cmd'
require 'telnetd/cmd/help_cmd'
require 'telnetd/cmd/uptime_cmd'
require 'telnetd/cmd/pwd_cmd'
require 'telnetd/cmd/dir_cmd'
require 'telnetd/cmd/cd_cmd'
require 'telnetd/cmd/touch_cmd'
require 'telnetd/cmd/cat_cmd'

module Telnetd
# Command Registry used to collect and manage the build in commands
# for the telnetd
class CommandRegistry

	# Read access to the commands
	attr_reader :commands

	# Create a new instance of the command registry.
	def initialize
		@commands = { 
			"cat" => CatCmd.new,
			"exit" => ExitCmd.new,
			"help" => HelpCmd.new,
			"uptime" => UptimeCmd.new,
			"pwd" => PwdCmd.new,
			"dir" => DirCmd.new,
			"cd" => CdCmd.new,
			"touch" => TouchCmd.new
		}
	end

	# Handle a client command by selection the command from
	# the registry and execute its instance.
	# ==== Arguments
	# *+client+ The client to execute the command for
	# *+command+ The command to be executed
	def handle(client, command)
		command = strip_cmd(command)
		cmd = command.split(' ')[0]
		if @commands.has_key? cmd
			@commands[cmd].handle(client, command)
		else
			handle_unknown_command(client, cmd)
		end
	end

private
	def strip_cmd(command)
		result = ""
		command.each_char { |c|
			if c.eql?("\b")
				result.chop!
			else
				result += c
			end
		}
		return result
	end

	def handle_unknown_command(client, command)
		UnknownCmd.new.handle(client, command)
	end
end
end
