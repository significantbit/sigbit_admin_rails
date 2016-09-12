# Sigbit Admin - Rails

[![Gem Version](https://badge.fury.io/rb/sigbit_admin_rails.svg)](https://badge.fury.io/rb/sigbit_admin_rails)

## Installation Guide
Add this to your Gemfile

    gem 'jquery-rails'
    gem 'sigbit_admin_rails'

Add this to your application.scss file

    @import 'variables_test'; //CUSTOM VARIABLES FILE
    @import 'sigbit-admin';

Add this to your application.js file

    //= require jquery
    //= require tether
    //= require bootstrap
    //= require sigbit-admin

### Override variables
Create a the file `app/assets/stylesheets/variables.scss` to override variables

### Helpers
This gem have some helpers to help you create some components easy, check the [Wiki](https://github.com/significantbit/sigbit_admin_rails/wiki) for more information
