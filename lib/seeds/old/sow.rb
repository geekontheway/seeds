module SeedsDep
  class Sow
    
    @@models_to_dump = {}
    @@drop_fields = []
    @@file_mode = 'w'
    
    def self.sow options = {}
      puts "WARNING!!!!! You are using the deprecated syntax for this gem."
      puts "No new features will be added to this syntax"
      puts "Please visit http://github.com/coreydaley/seeds to view the current documentation."
      if options.has_key?(:help)
        help
        exit
      end
      process_options options
      generate_seeds
    end
  end
end
