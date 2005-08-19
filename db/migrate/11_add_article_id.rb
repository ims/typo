class AddArticleId < ActiveRecord::Migration
  def self.up
    begin
      puts "Making your upload directory: "+File.expand_path("#{RAILS_ROOT}/public/files")
      Dir.mkdir("#{RAILS_ROOT}/public/files") unless File.directory?("#{RAILS_ROOT}/public/files") 
      print "Trying to add article_id to resources table ..."
      add_column :resources, :article_id, :integer
      Resource.find(:all) { |r| r.update }
      puts " done."
    rescue
      puts "\nERROR unable to add article_id column to resources table"
    end
  end

  def self.down
    begin
      print "Trying to drop article_id from resources table ..."
      remove_column :resources, :article_id
      puts " done."
    rescue
      puts "\nERROR dropping column article_id"
    end
  end
end