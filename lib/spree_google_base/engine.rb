module SpreeGoogleBase
  class Engine < Rails::Engine
    engine_name 'spree_google_base'

    config.autoload_paths += %W( #{config.root}/lib )

    initializer "spree.google_base.environment", :before => :load_config_initializers do |app|
      Spree::GoogleBase::Config = Spree::GoogleBaseConfiguration.new
      
      # See http://support.google.com/merchants/bin/answer.py?hl=en&answer=188494#US for all other fields
      SpreeGoogleBase::FeedBuilder::GOOGLE_BASE_ATTR_MAP = [
        ['g:id', 'id'],
        ['g:mpn', 'sku'],
        ['title', 'name'],
        ['description', 'google_base_description'],
        ['g:price', 'price'],
        ['g:condition', 'google_base_condition'],
        ['g:product_type', 'google_base_product_type'],
        ['g:brand', 'google_base_brand'],
        ['g:quantity','total_count_on_hand'],
        ['g:availability', 'google_base_availability']
      ]
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
    
  end
end
