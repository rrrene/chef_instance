# chef_instance [![Inline docs](http://inch-pages.github.io/github/miah/chef_instance.png)](http://inch-pages.github.io/github/miah/chef_instance)

## Why

What is our goal when we install a piece of daemonized software? Why does the
minutia of configuration concern us so greatly? Do we really want to emulate
shell scripts in a recipe and end up with hundreds of random resources on our node?
Why do I even care about resources on my node?

Before I answer those questions lets get back to our goal, which was?

Goal: A unique instance of a daemon with our supplied configuration.

## Usage

```
# In this hypothetical instance we have a 'pie' daemon named 'pumpkin' that stores
# pies recieved on port 314. We may want to run another instance called 'pecan' on
# a different port that receives different types of pies.
# htce::default.rb
pie_instance 'pumpkin' do
  # File owner and group.
  # Daemon user and group.
  user  'pumpkin'
  group 'pies'
  # creates `/opt/pies/pumpkins` then stores all config and runtime data.
  root_path  '/opt/pies'
  service_options({
    port: 314,
    store_pies: true,
    daemon_args: %w(-Tsteaming -Sdelicious)
  })
end
```

## How it works

Provides resource provider super classes for building instances of software.

```
class Chef
  class Resource
    class Daemon < Chef::Resource::Instance
    end
  end
end
```

Ignores system defaults (configuration, initscripts, etc).


## Code Style

This code follows the [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide) and all contributions should as well.

The code style is checked by [Rubocop](http://batsov.com/rubocop/) and can be checked by executing `rake test:rubocop` or `rubocop`.

[![Build Status](https://travis-ci.org/miah/chef_instance.png?branch=master)](https://travis-ci.org/miah/chef_instance)
[![Code Climate](https://codeclimate.com/github/miah/chef_instance.png)](https://codeclimate.com/github/miah/chef_instance)
[![Coverage Status](https://coveralls.io/repos/miah/chef_instance/badge.png)](https://coveralls.io/r/miah/chef_instance)

# Author

Author:: Miah Johnson (<miah@chia-pet.org>)

# License

    Copyright 2013 Miah Johnson

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
