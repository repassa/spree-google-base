require 'spec_helper'

describe Spree::Product do

  context "with GoogleBase support" do
    let(:product) { Factory(:product) }

    it 'should have a saved product record' do
      product.new_record?.should be_false
    end

    it 'should have google_base_condition' do
      product.google_base_condition.should_not be_nil
    end

    it 'should have google_base_description' do
      product.google_base_description.should_not be_nil
    end

    context 'w/ Brand property defined' do
      # Taken from the core filters parametrized example
      # /core/lib/spree/product_filters.rb

      before do
        property = Factory(:property, name: 'brand')
        Factory(:product_property, value: 'Brand Name', property_name: 'brand', product: product)
      end

      it 'should have a google brand' do
        product.google_base_brand.should == 'Brand Name'
      end
    end

    context 'w/out properties' do
      it 'should have a google brand' do
        product.google_base_brand.should be_nil
      end
    end

    context 'with enabled taxon mapping' do
      before do
        Spree::GoogleBase::Config.set enable_taxon_mapping: true
      end
      specify { product.google_base_product_type.should_not be_nil }
    end

    context 'with disabled taxon mapping' do
      before do
        Spree::GoogleBase::Config.set enable_taxon_mapping: false
      end
      specify { product.google_base_product_type.should be_nil }
    end

    context 'without images' do
      before do
        product.images.clear
      end
      specify { product.google_base_image_link.should be_nil }
    end

    context 'with images' do
      before(:each) do
        image = Factory(:image, viewable: product)
        product.reload

        Spree::GoogleBase::Config.set(public_domain: 'http://mydomain.com')
      end

      specify { product.google_base_image_link.should_not be_nil }

      it 'should output the image url with the specified domain' do
        image_link = product.google_base_image_link
        image_link.should == "#{Spree::GoogleBase::Config[:public_domain]}#{product.images[0].attachment.url(:product)}"
      end
    end

  end

end
