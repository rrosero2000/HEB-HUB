Select A.IncentiveID,
A.IsTemplate, 
A.FromTemplate, 
SUBSTRING(A.IncentiveName,0,100) IncentiveName, 
SUBSTRING(A.Description,0,1000) Description, 
A.PromoClassID, 
A.Priority, 
A.StartDate, 
A.EndDate, 
A.EveryDOW, 
A.EligibilityStartDate, 
A.EligibilityEndDate, 
A.TestingStartDate, 
A.TestingEndDate, 
A.P1DistQtyLimit, 
A.P1DistTimeType, 
A.P1DistPeriod,
A.P3DistQtyLimit,
A.P3DistTimeType,
A.P3DistPeriod,
A.EnableRedeemRpt,
A.CreatedDate,
A.LastUpdate,
A.Deleted, 
A.StatusFlag,
A.UpdateLevel,
A.CRMEngineID,
A.CRMEngineUpdateLevel,
A.CPEOADeployStatus,
A.CPEOARptDate,
A.CPEOADeploySuccessDate, 
A.DisabledOnCFW,
A.AllowOptOut,
A.EmployeesOnly,
A.EmployeesExcluded,
A.CreatedByAdminID,
A.LastUpdatedByAdminID,
A.DeferCalcToEOS,
A.EveryTOD,
A.SendIssuance,
A.EngineID, 
A.ClientOfferID,
A.P2DistQtyLimit,
A.P2DistTimeType, 
A.P2DistPeriod, 
A.CRMRestricted,
A.CPEOADeployRpt, 
A.ManufacturerCoupon,
A.ChargebackVendorID,
A.VendorCouponCode,
A.MutuallyExclusive,
A.EnableImpressRpt,
A.EngineSubTypeID,
A.AutoTransferable,
A.RestrictedRedemption,
isnull(C.startTime , '00:00:00') StartTime,
isnull(C.EndTime , '23:59:59') EndTime
FROM [LogixRT].[dbo].[CPE_Incentives] A
inner join [LogixRT].[dbo].[BannerOffers] B on  A.IncentiveID = B.OfferID
left join [LogixRT].[dbo].[CPE_IncentiveTOD] C on A.IncentiveID = C.IncentiveID
where B.BannerID = 2 
and A.StatusFlag = 0
and (CONVERT(VARCHAR(8), A.EndDate, 112) >= CONVERT(varchar(8), GETDATE()-1,112))
and A.LastUpdate > ?
and exists(select 1 from  [LogixRT].[dbo].CPE_RewardOptions ro 
			INNER JOIN [LogixRT].[dbo].cpe_deliverables dlv on dlv.RewardOptionID = ro.RewardOptionID
			inner join [LogixRT].[dbo].cpe_discounts dis on dlv.OutputID = dis.DiscountID
				where ro.IncentiveID = a.incentiveId
				)
order by A.LastUpdate ASC
