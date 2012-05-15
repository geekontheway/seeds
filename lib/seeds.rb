#Deprecated internal includes, all of our modules and classes
#This rake task and everything in the lib/old folder will be going away soon!
require "seeds/version"
require "seeds/old/sow"
require "seeds/old/process_options"
require "seeds/old/generate_seeds"
require "seeds/old/help"
module SeedsDep
  class Railtie < ::Rails::Railtie
    rake_tasks do
      namespace :seeds do
        desc "Generate the seeds.rb file"
        task :sow, [:options] => [:environment] do |t,args|
          SeedsDep::Sow.sow args[:options] ? eval(args[:options]) : {}
        end # task
      end # namespace
    end # rake_tasks
  end # Railtie
end # Module