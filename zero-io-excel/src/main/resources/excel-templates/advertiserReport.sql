SELECT
 ca_advertiser.contact_name AS '广告主名字',
 ca_advertiser.contact_phone AS '广告主联系方式',
 ca_advertiser.address AS '广告主地址',
 (
  SELECT
   COUNT(*)
  FROM
   ca_adverting_plan
  LEFT JOIN ca_advertiser t ON t.id = ca_adverting_plan.advertiser_id
  WHERE
   t.id = ca_advertiser.id
  AND MONTH (
   ca_adverting_plan.create_time
  ) = MONTH (CURDATE())
  AND YEAR (
   ca_adverting_plan.create_time
  ) = YEAR (CURDATE())
 ) AS '当月广告计划数量',
 (
  SELECT
   COUNT(*)
  FROM
   ca_adverting_plan
  LEFT JOIN ca_advertiser t ON t.id = ca_adverting_plan.advertiser_id
  WHERE
   t.id = ca_advertiser.id
  AND YEAR (
   ca_adverting_plan.create_time
  ) = YEAR (CURDATE())
 ) AS '当年广告计划数量'
FROM
 ca_advertiser