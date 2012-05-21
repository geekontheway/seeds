#Deprecated internal includes, all of our modules and classes
#This rake task will be going away soon!
require "seeds/version"
module Seeds
  class Railtie < ::Rails::Railtie
    rake_tasks do
      namespace :seeds do
        desc "Generate the seeds.rb file (this syntax has been deprecated, use seeds --help for more info"
        task :sow do
          puts "WARNING!!! You are using the deprecated version of the Seeds gem"
          puts "This rake task will be removed in the next version of this gem"
          puts "The old rake syntax for this command was awful and was deprecated"
          puts "Please visit http://github.com/coreydaley/seeds or run 'seeds --help' at the command prompt to see the new syntax."
          puts "Thank you for using the Seeds gem!"
        end # task
      end # namespace
    end # rake_tasks
  end # Railtie
end # Module