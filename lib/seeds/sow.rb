module Seeds
  class Sow
    
    @@models_to_dump = {}
    @@drop_fields = []
    
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
