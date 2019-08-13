require('pry')

require_relative('./models/property_manager')

PropertyManager.delete_all

enquiry1 = PropertyManager.new({
  'address' => '1 High Street',
  'value' => '220000',
  'number_of_bedrooms' => '5',
  'year_built' => '1899'
  })
enquiry2 = PropertyManager.new({
  'address' => '5 Shandwick Place',
  'value' => '350000',
  'number_of_bedrooms' => '2',
  'year_built' => '2005'
  })

  enquiry1.save()
  enquiry2.save()

  property = PropertyManager.find_by_id(4)

  # enquiry2.value = "999000"
  # enquiry2.update()


  binding.pry
  nil
