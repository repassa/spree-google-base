require 'net/ftp'

namespace :spree_google_base do
  task :generate_and_transfer => [:environment] do |t, args|
    SpreeGoogleBase::FeedBuilder.generate_and_transfer
  end

  task :generate_test_file => [:environment] do |t, args|
    puts "Dumping product catalog as Google Base XML"
    file_path = SpreeGoogleBase::FeedBuilder.generate_test_file("google_base_test.xml")
    puts "Finished dumping product catalog as Google Base XML. See it at [#{file_path}]."
  end
end
