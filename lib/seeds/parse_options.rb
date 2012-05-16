module Seeds
  class Sow
    def parse_options
      optparse = OptionParser.new do |opts|
        # Set a banner, displayed at the top
        # of the help screen.
        opts.banner = "Usage: seeds [options]"
        
        # Define the options, and what they do
        opts.on('--version', 'Output the version' ) do
          puts "Seeds v#{Seeds::VERSION}"
          exit!
        end
        
        # Models that we want to specifically include
        opts.on("--include Model1,Model2,Model3", Array, "Models that we want to specifically include") do |options|
          @options[:include] = options
        end
        
        # Models that we want to specifically exclude
        opts.on("--exclude Model1,Model2,Model3", Array, "Models that we want to specifically exclude") do |options|
          @options[:include] = options
        end
        
        # Fields that we want to drop from all Models
        opts.on("--drop_fields field1,field2,field3", Array, "Fields that we want to drop from all Models") do |options|
          @options[:include] = options
        end
        
        # Exclude commonly dropped fields
        @options[:drop_fields_common] = false
        opts.on('--drop_fields_common', 'Exclude commonly dropped fields (id, created_at, updated_at)') do
          @options[:drop_fields_common] = true
        end
        
        # Set the seeds.rb file write mode
        @options[:file_mode] = 'w'
        @options[:drop_fields_common] = false
        opts.on('--file_mode write|append', String ,'File write mode, default is write')  do |options|
          if options.downcase == 'append'
            @options[:file_mode] = 'a'
          elsif options.downcase == 'write'
            @options[:file_mode] = 'w'
          end
        end        
        
        # This displays the help screen, all programs are
         # assumed to have this option.
         opts.on('--help', 'Display this screen' ) do
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

