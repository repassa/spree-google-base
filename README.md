# Spree Google Merchant (for Spree 2.3.1)

This extension allows you to use Google Base to list products for free that will appear in Google Product Search (http://www.google.com/shopping).

[Learn more about Google Base](http://support.google.com/merchants/bin/answer.py?hl=en&answer=160540)

For product feed field definitions, (consult http://support.google.com/merchants/bin/answer.py?hl=en&answer=188494#US)

## INSTALLATION

1. Create Google Merchant account. Create Google Merchant ftp account (if applicable). Create data feed in Google Merchant with a type "Products" and name "google_merchant.xml".

2. Install the extension with one of the following commands

  - Add to Gemfile `gem 'spree_google_base', github: 'repassa/spree-google-base'`
  - Run `bundle install`
  - Run `rails g spree_google_base:install`
  - Run `rake db:migrate`

3. Edit product_type, priorities in spree admin (/admin/taxon_map)

4. Set preferences in spree admin panel (/admin/google_base_settings) for the feed title, public domain, feed description, ftp login and password. FTP login is not required - you may schedule upload from the public directory.

5. Issue the command `bundle exec rake spree_google_base:generate_and_transfer` to generate and upload the feed.

If you receive an error `501 Syntax error in parameters or arguments`, the FTP server is angry at you for not configuring your username\password correctly.

## ADVANCED CONFIGURATION

You can modify fields set for export and list of 'g:' attributes. Just create\modify config/initializers/google_base.rb and override values of GOOGLE_BASE_ATTR_MAP and GOOGLE_BASE_FILTERED_ATTRS arrays with help of Array#delete, Array#delete_at, Array#<<, Array#+=, etc.
Also you can override methods from product_decorator.rb in your site extension.

## CRONJOBS

There are two options to regulate Google Merchant product update:

A) Try to run `rake spree_google_base:generate_test_file`
B) Setup cronjobs to run `rake spree_google_base:generate_and_transfer`
