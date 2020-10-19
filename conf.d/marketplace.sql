SELECT "location"."id",
       "location"."company_id" AS "company_id",
       "location"."name",
       "location"."phone",
       "location"."email",
       "location"."status",
       "location"."district",
       "location"."ward",
       "location"."address",
       "location"."latitude",
       "location"."longitude",
       "location"."description",
       "location"."path_name" AS "path_name",
       "location"."title",
       "location"."iso_marketplace" AS "iso_marketplace",
       "location"."opened_at" AS "opened_at",
       "location"."place_id" AS "place_id",
       "location"."country" AS "country",
       "location"."full_address" AS "full_address",
       "location"."city",
       "location"."province" AS "province",
       "location"."street" AS "street",
       "marketplace_values"."id" AS "marketplace_values.id",
       "marketplace_values"."field_id" AS "marketplace_values.field_id",
       "marketplace_values"."location_id" AS "marketplace_values.location_id",
       "marketplace_values"."value" AS "marketplace_values.value",
       "marketplace_values.marketplace_field"."id" AS "marketplace_values.marketplace_field.id",
       "marketplace_values.marketplace_field"."type" AS "marketplace_values.marketplace_field.type",
       "marketplace_values.marketplace_field"."name" AS "marketplace_values.marketplace_field.name",
       "marketplace_values.marketplace_field"."options" AS "marketplace_values.marketplace_field.options",
       "location_images"."id" AS "location_images.id",
       "location_images"."path" AS "location_images.path",
       "location_images"."is_avatar" AS "location_images.is_avatar",
       "company"."id" AS "company.id",
       "company.cate_services"."id" AS "company.cate_services.id",
       "company.cate_services"."name" AS "company.cate_services.name",
       "company.company_detail"."id" AS "company.company_detail.id",
       "company.company_detail"."company_id" AS "company.company_detail.company_id",
       "company.company_detail"."business_type" AS "company.company_detail.business_type",
       "company.company_detail"."business_name" AS "company.company_detail.business_name",
       "company.company_detail"."phone" AS "company.company_detail.phone",
       "company.company_detail"."description" AS "company.company_detail.description",
       "services"."id" AS "services.id",
       "services"."name" AS "services.name",
       "services"."status" AS "services.status",
       "services"."cate_service_id" AS "services.cate_service_id",
       "services"."service_code" AS "services.service_code",
       "services"."description" AS "services.description",
       "services"."sale_price" AS "services.salePrice",
       "services"."duration" AS "services.duration",
       "services"."color" AS "services.color",
       "services"."is_allowed_marketplace" AS "services.is_allowed_marketplace",
       "services"."allow_gender" AS "services.allowGender",
       "services.location_service"."id" AS "services.location_service.id",
       "services.location_service"."service_id" AS "services.location_service.service_id",
       "services.location_service"."location_id" AS "services.location_service.location_id"
FROM "location" AS "location"
LEFT JOIN "marketplace_value" AS "marketplace_values"
	ON "location"."id" = "marketplace_values"."location_id"
		AND "marketplace_values"."deleted_at" IS NULL
LEFT JOIN "marketplace_fields" AS "marketplace_values.marketplace_field"
	ON "marketplace_values"."field_id" = "marketplace_values.marketplace_field"."id"
		AND "marketplace_values.marketplace_field"."deleted_at" IS NULL
LEFT JOIN "location_image" AS "location_images"
	ON "location"."id" = "location_images"."location_id"
		AND "location_images"."deleted_at" IS NULL
LEFT JOIN "company" AS "company"
	ON "location"."company_id" = "company"."id"
		AND "company"."deleted_at" IS NULL
LEFT JOIN "cate_service" AS "company.cate_services"
	ON "company"."id" = "company.cate_services"."company_id"
		AND "company.cate_services"."deleted_at" IS NULL
LEFT JOIN "company_detail" AS "company.company_detail"
	ON "company"."id" = "company.company_detail"."company_id"
		AND "company.company_detail"."deleted_at" IS NULL
INNER JOIN ("location_services" AS "services.location_service"
  INNER JOIN "service" AS "services"
		ON "services"."id" = "services.location_service"."service_id"
			AND ("services.location_service"."deleted_at" IS NULL))
	ON "location"."id" = "services.location_service"."location_id"
		AND ("services"."deleted_at" IS NULL
			 AND "company.cate_services"."id" = "services"."cate_service_id")
WHERE "location"."deleted_at" IS NULL


