SELECT t_project_receipt_record.*,
       t_project.name as projectName,
       t_project.category_code as categoryCode,
       t_project.category_name as categoryName,
       vms_vender.`name` as orgName,
       GROUP_CONCAT(t_project_master_relation.name) AS agentName,
       t_project.contract_amount as contractAmount,
       t_project.contract_time as contractTime

FROM t_project_receipt_record
         left join t_project on t_project.id = t_project_receipt_record.project_id
         LEFT JOIN t_project_master_relation on t_project_master_relation.project_id = t_project.id
         LEFT JOIN vms_vender on  vms_vender.id = t_project.org_id
group by id
