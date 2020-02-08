require 'csv'
seed_file = './lib/assets/input/cafes_2015.csv'

CSV.foreach(seed_file, headers: true, header_converters: :symbol) do |row|
  post = PostalCode.find_or_create_by!(code: row[:post_code])
  post.cafes.create!(
    name: row[:caferestaurant_name],
    address: row[:street_address],
    chairs: row[:number_of_chairs]
  )
end