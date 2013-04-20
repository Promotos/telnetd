
require 'test/unit'
require 'telnetd/client_context'

# Tests for the client context
class TestClientContext < Test::Unit::TestCase

	# Test if the start time is set in the past.
	def test_start_time
		context = ClientContext.new
		sleep(1)
		assert(context.start_time < Time.now, "Expect start time before now.")
	end

	# Test list the available folders.
	def test_list_folders
		context = ClientContext.new
		assert(context.list_folders.empty? == false)
	end

	# Test list the available files.
	def test_list_files
		context = ClientContext.new
		assert(context.list_files.empty? == false)
	end
end