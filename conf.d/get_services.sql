SELECT
	service."id" AS "id",
	service.status AS "status",
	service.created_at AS "createdAt",
	service.updated_at AS "updatedAt",
	service.deleted_at AS "deletedAt",
	service.description AS "description",
	service.sale_price AS "salePrice",
	service.duration AS "duration",
	service."name" AS "color",
	service.color AS "color",
	service.service_code AS "service_code",
	service.unit_price AS "unit_price",
	service.allow_gender AS "allow_gender",
	service.name_en AS "name_en",
	service.cate_service_id AS "cateSericeId",
	cate_service.color AS "cate_service.color",
	cate_service.excerpt AS "cate_service.excerpt",
	cate_service."name" AS "cate_service.name",
	cate_service.company_id AS "cate_service.company_id",
	service_image.is_avatar AS "service_image.is_avatar",
	service_image."path" AS "service_image.path",
	service_image."id" AS "service_image.id",
	location_services.location_id AS "location_services.location_id",
	location_services.service_id AS "location_services.service_id",
	location_services."id" AS "location_services.id",
	service_staff.service_id AS "service_staff.service_id",
	service_staff.staff_id AS "service_staff.staff_id",
	service_staff."id" AS "service_staff.id",
	cate_service."id" AS "cate_service.id"
FROM
	service
	INNER JOIN
	location_services
	ON
		service."id" = location_services.service_id AND
		location_services.deleted_at IS NULL
	INNER JOIN
	cate_service
	ON
		cate_service."id" = service.cate_service_id AND
		cate_service.deleted_at IS NULL
	LEFT JOIN
	service_staff
	ON
		service."id" = service_staff.service_id AND
		service_staff.deleted_at IS NULL
	LEFT JOIN
	service_image
	ON
		service_image.service_id = service."id" AND
		service_image.deleted_at IS NULL
WHERE
	service.deleted_at IS NULL
