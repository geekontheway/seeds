module Seeds
  class Sow
    def generate_seeds
      file = File.open("#{Rails.root}/db/seeds.rb", @options[:file_mode])
      @models_to_dump.each do |model_name, truefalse|
        seeds = []
        if @options[:truncate_models_all] == true || (@options.has_key?(:truncate_models) && @options[:truncate_models].include?(model_name))
          seeds << "#Truncating model [#{model_name}]"
          seeds << "puts \"Truncating model [#{model_name}]\""
          puts "Generate truncate statement for model [#{model_name}]"
          seeds << "#{model_name}.delete_all()"
        end
        seeds << "#Exporting records for model [#{model_name}]"
        puts "Exporting records for model [#{model_name}]..."
        begin
          model_name.constantize.all.each do |r|
            unless r.to_s == 'SchemaMigration'
                attributes_hash = []
                r.attributes.collect do |attr|
                  unless @drop_fields.size > 0 && @drop_fields.include?(attr[0])
                    attributes_hash << ":#{attr[0]} => %q[#{attr[1]}]"
                  end
                end
                seeds << "#{model_name}.create(#{attributes_hash.join(", ")})"
            end 
          end  
        rescue Exception => e
          puts e
        end
        seeds << "#Finished exporting #{seeds.size - 1} records for model [#{model_name}]"
        seeds << "puts \"Finished importing #{seeds.size - 1} records for model [#{model_name}] Records:\""
        puts "Finished exporting #{seeds.size - 1} records for model [#{model_name}]"
        seeds.each{ |s| file.puts s}
      end
      file.close
    end
  end
end
