# Subscirbe Take Home 

This app is a rudimentary solution to the given take-home coding challenge.

**NOTES TO REVIEWER:**

**Summary:**
I limited the implementation time to 4 hours as expected, this lead to an incomplete solution as the requirements weren't clear about how to apply rounding rules and how "Sales Taxes" are calculated in the example outputs.

**Assumptions / Context:**

I didn't know if this module / logic would be included in a larger system or how it was intended to be used so I tried to make the implementation as independent as possible.  

**IF I HAD MORE TIME / RESOURCES:**
* I would have a discussion with a PM or equivalent to understand the business use case(s) for this software 
* I would understand how this fits into the larger hierarchy and refactor / expand as appropriate
* Finish implementation after understanding the ambiguities mentioned above 
* Add / Complete additional test files 
* Use a logger to generate standardized logging messages to a file or files instead of STDOUT
* Integrate with an AI to solve the Exemption categorization problem
* More robust input checking especially for the parser and more specific error handling
* Potentially dockerize the project to make setup and running easier depending on use case
* Potentially make this project a gem depending on use case
* All TODOs mentioned in the code

## Requirements

Please ensure you have Ruby 3.2.0 installed. 

I used RVM to manage an independent Gemset for the project, but feel free to use ASDF or whatever you're most comfortable with.

If using RVM on mac you can use this command to get a clean install of Ruby 3.2.0:
```
rvm reinstall 3.2.0 --with-openssl-dir=$(brew --prefix openssl) --with-readline-dir=$(brew --prefix readline) --with-libyaml-dir=$(brew --prefix libyaml) --disable-dtrace --disable-docs
```

## Initial setup
```
bundle install
```

## Running the Code 
Either run the code from the command line:
```
cd lib
irb
require 'main.rb'
Main.process_order(absolute_file_path_to_input_file_as_string)
```

Or add an integration test case to main_spec.rb following established patterns and run using RSpec.
