module Seeds
  class Sow
    #Initialize our options hash
    def initialize 
      @options = {:exclude => ["SchemaMigration"]}
      @models_to_dump = {}
      @drop_fields = []
    end
    attr_accessor :options
  end
end
