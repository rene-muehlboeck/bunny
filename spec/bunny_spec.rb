# bunny_spec.rb

require File.expand_path(File.join(File.dirname(__FILE__), %w[.. lib bunny]))

describe Bunny do
	
	before(:each) do
    @b = Bunny.new
		@b.start
	end
	
	after(:each) do
		@b.stop
	end
	
  it "should connect to an AMQP server" do
    @b.status.should == 'CONNECTED'
  end

	it "should be able to create an exchange" do
		exch = @b.exchange(:direct, 'test_exchange')
		exch.should be_an_instance_of Exchange
		exch.name.should == 'test_exchange'
		@b.exchanges.has_key?('test_exchange').should be true
	end

	it "should be able to create a queue" do
		q = @b.queue('test1')
		q.should be_an_instance_of Queue
		q.name.should == 'test1'
		@b.queues.has_key?('test1').should be true
  end

end