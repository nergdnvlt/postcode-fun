module CsvInfo
  def self.headers
    [
      'Cafe',
      'Address',
      'Post Code',
      'Number of Chairs',
      'Category'
    ]
  end

  def csv_format
    [
      name,
      address,
      postal_code.code,
      chairs,
      category
    ]
  end
end