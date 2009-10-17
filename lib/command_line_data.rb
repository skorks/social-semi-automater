require 'getoptlong'

class CommandLineData
  attr_reader :username, :password
  def initialize
    @opts = GetoptLong.new(
      ["--reddit-user", "-u", GetoptLong::REQUIRED_ARGUMENT ],
      ["--reddit-pass", "-p", GetoptLong::REQUIRED_ARGUMENT ],
      ["--help", "-h", GetoptLong::NO_ARGUMENT ]
    )
    read_arguments
  end

  def read_arguments
    @opts.each do |option, argument|
      case option
      when "--reddit-user"
        @username = argument
      when "--reddit-pass"
        @password = argument
      when "--help"
        print_usage
      end
    end
    if username == nil or password == nil
      print_usage_and_exit
    end
  end

  def print_usage_and_exit
    print_usage
    exit 1
  end

  def print_usage
    puts "You need to supply the reddit username and password for an account, e.g."
    puts "ruby social_semi_automater.rb -u user -p pass"
  end
end
