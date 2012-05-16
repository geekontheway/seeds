module Seeds
  class Sow
    def generate_seeds
      file = File.open("#{Rails.root}/db/seeds.rb", @options[:file_mode])
      @models_to_dump.each do |model_name, truefalse|
        seeds = []
        seeds << "#Dumping model [#{model_name}]"
        puts "Processing model #{model_name}..."
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
        seeds << "#Finished dumping model [#{model_name}] Records:#{seeds.size - 1}"
        seeds.each{ |s| file.puts s}
      end
      file.close
    end
  end
end
