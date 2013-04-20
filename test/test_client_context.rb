
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

	def test_list
		context = ClientContext.new
		puts context.list
	end
end