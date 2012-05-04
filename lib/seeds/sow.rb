module Seeds
  class Sow
    
    @@models_to_dump = {}
    @@drop_fields = []
    @@file_mode = 'w'
    
    def self.sow options = {}
      if options.has_key?(:help)
        help
        exit
      end
      process_options options
      generate_seeds
    end
  end
end
