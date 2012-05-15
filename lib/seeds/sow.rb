module Seeds
  class Sow
    #Initialize our options hash
    def initialize 
      @options = {
        :force_create => false,
        :include => true,
        :exclude => false,
        :drop_fields => false,
        :drop_fields_common => false,
        :file_mode => "write"
      }
    end
    attr_accessor :options
    
    @models_to_dump = {}
    @drop_fields = []
    @file_mode = 'w'
    
    def sow
      if @options.has_key?(:help)
        help
        exit
      end
      process_options options
      generate_seeds
    end
  end
end
