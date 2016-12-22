# Sigbit Admin - Rails

[![Gem Version](https://badge.fury.io/rb/sigbit_admin_rails.svg)](https://badge.fury.io/rb/sigbit_admin_rails)

## Installation Guide
Add this to your Gemfile

    source 'https://rails-assets.org' do
      gem 'rails-assets-tether', '>= 1.1.0'
    end

    gem 'jquery-rails'
    gem 'sigbit_admin_rails'

Add this to your application.scss file

    @import 'variables_test'; //CUSTOM VARIABLES FILE
    @import 'sigbit-admin';

Add this to your application.js file

    //= require sigbit-admin

### Override variables
Create a the file `app/assets/stylesheets/variables.scss` to override variables

### Devise Views
If you are using devise you can install sigbit-admin devise views by running the following generator

```
rails g sigbit_admin_rails:views
```

### Helpers
This gem have some helpers to help you create some components easy, check the [Wiki](https://github.com/significantbit/sigbit_admin_rails/wiki) for more information

### Update Version
There is a rake task to update sass/js from latest master version of [sigbit-admin](https://github.com/significantbit/sigbit-admin).
Run the following command to update

```
rake update
```
