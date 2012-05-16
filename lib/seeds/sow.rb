module Seeds
  class Sow
    #Initialize our options hash
    def initialize 
      @start_time = Time.now
      @options = {}
      @models_to_dump = {}
      @drop_fields
    end
    attr_accessor :options
    def sow
      generate_seeds
    end
  end
end
