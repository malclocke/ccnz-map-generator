require 'open-uri'
namespace :eqnz do
  desc "update the category list"
  task :categories => :environment do
    response = open('http://eq.org.nz/api?task=categories')
    json = ActiveSupport::JSON.decode(response.read)
    json["payload"]["categories"].each do |json_category|
      attributes = json_category['category']
      category = Category.find_or_initialize_by_id(attributes["id"])
      puts (category.new_record? ? 'Creating' : 'Updating') + " category #{attributes['id']}"
      category.update_attributes! attributes
    end
  end
end
