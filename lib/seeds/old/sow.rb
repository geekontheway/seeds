module Seeds
  class Sow
    
    @@models_to_dump = {}
    @@drop_fields = []
    @@file_mode = 'w'
    
    def self.sow options = {}
      puts "You are using the deprecated version of this gem."
      if options.has_key?(:help)
        help
        exit
      end
      process_options options
      generate_seeds
    end
  end
end
