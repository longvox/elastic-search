map['id'] = event.get('id')
map['status'] = event.get('status')
map['created_at'] = event.get('createdAt')
map['updated_at'] = event.get('updatedAt')
map['deleted_at'] = event.get('deletedAt')
map['description'] = event.get('description')
map['sale_price'] = event.get('salePrice')
map['duration'] = event.get('duration')
map['name'] = event.get('color')
map['color'] = event.get('color')
map['service_code'] = event.get('service_code')
map['unit_price'] = event.get('unit_price')
map['allow_gender'] = event.get('allow_gender')
map['name_en'] = event.get('name_en')
map['cate_service_id'] = event.get('cateSericeId')
map['cate_service'] = {
  'id' => event.get('cate_service.id'),
  'color' => event.get('cate_service.color'),
  'excerpt' => event.get('cate_service.excerpt'),
  'name' => event.get('cate_service.name'),
  'company_id' => event.get('cate_service.company_id')
}
map['service_image'] = {
  'id' => event.get('service_image.id'),
  'path' => event.get('service_image.path'),
  'is_avatar' => event.get('service_image.is_avatar')
}
map['location_services'] ||= []
map['location_services'] << {
  'id' => event.get('location_services.id'),
  'location_id' => event.get('location_services.location_id'),
  'service_id' => event.get('location_services.service_id')
}
map['location_services'] = map['location_services'].uniq { |item| item['id'] }
map['service_staff'] ||= []
map['service_staff'] << {
  'service_id' => event.get('service_staff.service_id'),
  'staff_id' => event.get('service_staff.staff_id'),
  'id' => event.get('service_staff.id')
}
map['service_staff'] = map['service_staff'].uniq { |item| item['id'] }
event.cancel()

