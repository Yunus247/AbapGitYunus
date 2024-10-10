@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'department'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity Z37_R_DEPARTMENT
  as select from /lrn/depment_rel
  association [0..*] to Z14_R_EMPLOYEE as _Employee 
  on $projection.Id = _Employee.DepartmentID
  association [0..1] to Z14_R_EMPLOYEE as _Head     
  on $projection.HeadId = _Head.EmployeeId
  association [1..1] to Z14_R_EMPLOYEE as _Assistant   
  on $projection.AssistantId = _Assistant.EmployeeId
{
  key id                    as Id,
      description           as Description,
      head_id               as HeadId,
      assistant_id          as AssistantId,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,
      
      _Employee ,
      _Head, 
      _Assistant
}
