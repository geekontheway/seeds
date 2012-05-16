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
        
        opts.on("-l", "--large lSku1,lSku2,lSkuN", Array, "Large SKUs - List CSVs") do |l|
          @options[:large_skus] = l
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

