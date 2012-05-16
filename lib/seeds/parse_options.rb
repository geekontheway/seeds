module Seeds
  class Sow
    def parse_options
      optparse = OptionParser.new do |opts|
        # Set a banner, displayed at the top
        # of the help screen.
        opts.banner = "Usage: seeds [options]"
        
        # Define the options, and what they do
        opts.on( '-v', '--version', 'Output the version' ) do
          puts "Seeds v#{Seeds::VERSION}"
          exit!
        end
        
        #Models that we want to specifically include
        opts.on("-i", "--include Model1,Model2,Model3", Array, "Models that we want to specifically include") do |l|
          @options[:include] = l
        end
        
        #Models that we want to specifically exclude
        opts.on("-e", "--exclude Model1,Model2,Model3", Array, "Models that we want to specifically exclude") do |l|
          @options[:include] = l
        end
        
        # This displays the help screen, all programs are
         # assumed to have this option.
         opts.on( '-h', '--help', 'Display this screen' ) do
           puts opts
           exit!
         end
      end
      
      #Run the parser
      begin
        optparse.parse!
      rescue Exception => e
        puts e
        exit!
      end
    end
  end
end

