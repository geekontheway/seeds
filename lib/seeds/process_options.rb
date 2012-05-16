module Seeds
  class Sow
    def process_options
      models_to_dump = {}
      if @options.has_key?(:include)
        #include_models = options[:include].split(" ")
        @options[:include].each_with_index do |item,index|
          @options[:include][index] = item.underscore.singularize.camelize
        end
      end
      if @options.has_key?(:exclude)
        #exclude_models = options[:exclude].split(" ")
        @options[:exclude].each_with_index do |item,index|
          @options[:exclude][index] = item.underscore.singularize.camelize
        end
      end
      if !@options.has_key?(:include) && !@options.has_key?(:exclude)
        ActiveRecord::Base.connection.tables.collect do |table_name|
          model_name = table_name.underscore.singularize.camelize
          @models_to_dump[model_name] = true 
        end
      elsif @options.has_key?(:include) && !@options.has_key?(:exclude)
        ActiveRecord::Base.connection.tables.collect do |table_name|
          model_name = table_name.underscore.singularize.camelize
          if @options[:include].include?(model_name)
            @models_to_dump[model_name] = true
          end 
        end
      elsif @options.has_key?(:exclude) && !@options.has_key?(:include)
        ActiveRecord::Base.connection.tables.collect do |table_name|
          model_name = table_name.underscore.singularize.camelize
          if !@options[:exclude].include?(model_name)
            @models_to_dump[model_name] = true
          end
        end
      elsif @options.has_key?(:include) && @options.has_key?(:exclude)
        @options[:include].each_with_index do |item,index|
          if !@options[:exclude].include?(item)
            model_name = item.underscore.singularize.camelize
            @models_to_dump[model_name] = true
          end
        end
      end
      if @options.has_key?(:drop_fields)
        @options[:drop_fields].each do |item|
          @drop_fields<< item
        end
      end
      if @options.has_key?(:drop_fields_common) && @options[:drop_fields_common] == true
        @drop_fields<< "id"
        @drop_fields<< "created_at"
        @drop_fields<< "updated_at"
      end
    end
  end
end

