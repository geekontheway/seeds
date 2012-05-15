require "seeds/version"
require "seeds/old/sow"
require "seeds/old/process_options"
require "seeds/old/generate_seeds"
require "seeds/old/help"

module Seeds
  class Railtie < ::Rails::Railtie
    rake_tasks do
      namespace :seeds do
        desc "Generate the seeds.rb file"
        task :sow, [:options] => [:environment] do |t,args|
          Seeds::Sow.sow args[:options] ? eval(args[:options]) : {}
        end # task
      end # namespace
    end # rake_tasks
  end # Railtie
end # Module
