# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Staffs extension
Refinery::Staffs::Engine.load_seed

# Added by Refinery CMS Services extension
Refinery::Services::Engine.load_seed

# Added by Refinery CMS References extension
Refinery::References::Engine.load_seed

# Added by Refinery CMS Technologies extension
Refinery::Technologies::Engine.load_seed

# Added by Refinery CMS Customers extension
Refinery::Customers::Engine.load_seed

# Added by Refinery CMS Clients extension
Refinery::Shinetech::Engine.load_seed
