module Spree
  class GoogleBaseConfiguration < Preferences::Configuration
    preference :title, :string, default: ''
    preference :store_name, :string, default: ''
    preference :description, :text, default: ''
    preference :ftp_username, :string, default: ''
    preference :ftp_password, :password, default: ''
    preference :enable_taxon_mapping, :boolean, default: false
    preference :enable_additional_images, :boolean, default: false

    # No default value provided
    # Omit trailing slash when setting

    preference :public_domain, :string
  end
end
