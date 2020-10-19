SELECT
	service."id" as "service.id",
	service."name" as "service.name",
	cate_service."id",
	cate_service."name"
FROM
	cate_service
	INNER JOIN service ON cate_service."id" = service.cate_service_id
