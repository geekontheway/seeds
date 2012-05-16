module Seeds
  class Sow
    #Initialize our options hash
    def initialize 
      @start_time = Time.now
      @options = {}
    end
    
    def sow
      generate_seeds
    end
  end
end
