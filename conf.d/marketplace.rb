begin
  map['id'] = event.get('id')
  map['company_id'] = event.get('company_id')
  map['name'] = event.get('name')
  map['phone'] = event.get('phone')
  map['email'] = event.get('email')
  map['status'] = event.get('status')
  map['city'] = event.get('city')
  map['district'] = event.get('district')
  map['ward'] = event.get('ward')
  map['address'] = event.get('address')
  map['latitude'] = event.get('latitude')
  map['longitude'] = event.get('longitude')
  map['description'] = event.get('description')
  map['path_name'] = event.get('path_name')
  map['title'] = event.get('title')
  map['iso_marketplace'] = event.get('iso_marketplace')
  map['place_id'] = event.get('place_id')
  map['country'] = event.get('country')
  map['full_address'] = event.get('full_address')
  map['province'] = event.get('province')
  map['street'] = event.get('street')
  map['oepen_at'] = event.get('open_at')
  map['marketplace_values'] ||= []
  map['marketplace_values'] << {
    'id' => event.get('marketplace_values.id'),
    'field_id' => event.get('marketplace_values.field_id'),
    'location_id' => event.get('marketplace_values.location_id'),
    'value' => event.get('marketplace_values.value'),
    'marketplace_field' => {
      'id' => event.get('marketplace_values.marketplace_field.id'),
      'type' => event.get('marketplace_values.marketplace_field.type'),
      'name' => event.get('marketplace_values.marketplace_field.name'),
      'options' => event.get('marketplace_values.marketplace_field.options')
    }
  }
  map['marketplace_values'] = map['marketplace_values'].uniq { |item| item['id'] }
  map['location_images'] ||= []
  map['location_images'] << {
    'id' => event.get('location_images.id'),
    'path' => event.get('location_images.path'),
    'is_avatar' => event.get('location_images.is_avatar')
  }
  map['location_images'] = map['location_images'].uniq { |item| item['id'] }
  puts 1
  marketplace_values = map['marketplace_values'].find{ |item| item['id'] == event.get('marketplace_values.id')}
  puts 3
  map['company'] ||= []
  map['company'] << {
    'id' => event.get('company.id'),
    'cate_services' => [],
    'company_detail' => []
  }
  map['company'] = map['company'].uniq { |item| item['id'] }
  puts 4
  company = map['company'].find{ |item| item['id'] == event.get('company.id')}
  if company
    if company['cate_services'].class == Array
      puts 4.3
      company['cate_services'] << {
        'id' => event.get('company.cate_services.id'),
        'name' => event.get('company.cate_services.name')
      }
      company['cate_services'] = company['cate_services'].uniq { |item| item['id'] }
    end
    if company['company_detail'].class == Array
      puts 4.6
      company['company_detail'] << {
        'id' => event.get('company.company_detail.id'),
        'company_id' => event.get('company.company_detail.company_id'),
        'business_type' => event.get('company.company_detail.business_type'),
        'business_name' => event.get('company.company_detail.business_name'),
        'phone' => event.get('company.company_detail.phone'),
        'description' => event.get('company.company_detail.description')
      }
      company['company_detail'] = company['company_detail'].uniq { |item| item['id'] }
    end
  end
  puts 5
  map['services'] ||= []
  map['services'] << {
    'id' => event.get('services.id'),
    'name' => event.get('services.name'),
    'status' => event.get('services.status'),
    'cate_service_id' => event.get('services.cate_service_id'),
    'service_code' => event.get('services.service_code'),
    'description' => event.get('services.description'),
    'sale_price' => event.get('services.salePrice'),
    'duration' => event.get('services.duration'),
    'color' => event.get('services.color'),
    'is_allowed_marketplace' => event.get('services.is_allowed_marketplace'),
    'allow_gender' => event.get('services.allowGender'),
    'location_service' => []
  }
  map['services'] = map['services'].uniq { |item| item['id'] }
  services = map['services'].find{ |item| item['id'] == event.get('services.id')}
  if services && services['location_service'] && services['location_service'].class == Array
    puts 5.5
    services['location_service'] << {
      'id' => event.get('services.location_service.id'),
      'service_id' => event.get('services.location_service.service_id'),
      'location_id' => event.get('services.location_service.location_id')
    }
    services['location_service'] = services['location_service'].uniq { |item| item['id'] }
  end
rescue StandardError => e
  puts e.message
  puts e.backtrace.inspect
  puts e
end
event.cancel()
