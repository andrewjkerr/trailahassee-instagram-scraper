# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

task load_api: :environment do
  url = "http://tlcdomi.leoncountyfl.gov/arcgis/rest/services/MapServices/TLCDOMI_FeatureAccess_Trailahassee_D_WM/MapServer/3/query?where=1%3D1&text=&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR=&spatialRel=esriSpatialRelIntersects&relationParam=&outFields=*&returnGeometry=true&maxAllowableOffset=&geometryPrecision=&outSR=&returnIdsOnly=false&returnCountOnly=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&returnZ=false&returnM=false&gdbVersion=&returnDistinctValues=false&f=pjson"
  resp = HTTParty.get(url)

  parks = []
  features_arr = JSON.parse(resp.body)["features"]
  features_arr.each do |park|
    park_name = park["attributes"]["PARKNAME"]
    park_name
    Park.create({ name: park_name, insta_tag: park_name.gsub(/\s/, '') })
  end
end
