require "seeds/version"
require "seeds/sow"
require "seeds/process_options"
require "seeds/generate_seeds"
require "seeds/help"

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
