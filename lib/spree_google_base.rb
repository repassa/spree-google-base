require 'spree_core'

module Spree
  module GoogleBase
    def self.config(&block)
      yield(Spree::GoogleBase::Config)
    end
  end
end

require 'spree_google_base/engine'
