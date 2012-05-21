# Seeds

A feature filled way to generate your db/seeds.rb file from your existing database tables.
I will be adding many more features and updating the way that the current features work very soon.
But for now, this should be a nice and easy way to generate a seeds.rb file!

This gem has been completely overhauled and can now be run from the command line using standard linux/unix command syntax.

## Installation

Add this line to your application's Gemfile:

    gem 'seeds'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install seeds

## Usage

No need to fire up the rails console anymore, this baby runs directly from the command line using standard unix/linux sytanx.


To create a seeds.rb file that includes data from all of your Models

    $ seeds
    
To display the Seeds help file

    $ seeds --help
    
To only include certain Models (this should work using table names also, but it's not tested yet)

    $ seeds --include Model1,Model2,Model3

To only exclude certain Models, takes precedence over --include (this should work using table names also, but it's not tested yet)

    $ seeds --exclude Model1,Model2,Model3
    
To drop specific fields from all Model dumps, can be used with --drop-fields-common

    $ seeds --drop-fields Field1,Field2,Field3
    
To drop a predefined "common" set of fields (id, created_at, updated_at), can be used with --drop-fields

    $ seeds --drop-fields-common
    
To rewrite or append to seeds.rb file.  If option is not passed, write is assumed.

    $ seeds --file-mode write # Write the file, this is the default
    $ seeds --file-model append # Append to the existing file, commonly used with --drop-fields-common
    
Example sending multiple options

    $ seeds --drop-fields-common --drop-fields Field1,Field2 --include Model1,Model2
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Thank you to Contributors

ernie - For mentoring me all these years and always being there to give me a good kick in the pants when I need it most.

krisleech - Fixed issue #1! Thanks man, can't believe I missed that, pretty embarrassing :)
