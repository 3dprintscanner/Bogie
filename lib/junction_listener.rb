require 'stomp'

begin
  # Credentials set here as environment variables
  # @user = ENV["DATAFEEDS_USER"]
  # @password = ENV["DATAFEEDS_PASSWORD"]
  @key = ENV["DATAFEEDS_KEY"]
  @host = "datafeeds.networkrail.co.uk"
  @port = 61613

  # puts "Check user"
  # @user  = CGI::escape(ENV['DATAFEEDS_USER'])
  @user = 'd3user'
  @password = 'd3password'
  @key = 'D36f743bd6-a870-4f9c-9424-aa1b901642b3'

  # puts split
  # Example destination add yours here
  @destination = "/topic/TD_MC_EM_SIG_AREA"

  puts "Connecting to datafeeds as #{@user} using stomp protocol stomp://#{@host}:#{@port}\n"
  @connection = Stomp::Connection.open @user, @password, @host, @port, true
  @connection.subscribe @destination

  while true
    @msg = @connection.receive
    puts @msg
  end
  @connection.disconnect
rescue
end