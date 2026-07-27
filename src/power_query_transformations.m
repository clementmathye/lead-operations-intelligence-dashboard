let
    Source = Excel.Workbook(File.Contents("D:\Portfolio_Lead_Operations_Data (1).xlsx"), null, true),
    Dim_Lead_Sheet = Source{[Item="Dim_Lead",Kind="Sheet"]}[Data],
    #"Promoted Headers" = Table.PromoteHeaders(Dim_Lead_Sheet, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"Lead ID", type text}, {"Business Name", type text}, {"Business Manager", type text}, {"Niche", type text}, {"Suburb", type text}, {"Business Email", type text}, {"Personal Email", type text}, {"Business Number", Int64.Type}, {"WhatsApp Number", Int64.Type}, {"Website", type text}, {"Pipeline Status", type text}, {"Date Added", type date}, {"Review Count", Int64.Type}, {"Review Rating", type number}, {"Priority Level", type text}, {"Quick Notes", type text}, {"Column17", type any}, {"Column18", type any}, {"Column19", type any}, {"Column20", type any}, {"Column21", type any}, {"Column22", type any}, {"Column23", type any}, {"Column24", type any}}),
    #"Removed Columns" = Table.RemoveColumns(#"Changed Type",{"Business Manager", "Business Email", "Personal Email", "Column21", "Column22", "Column23", "Column24", "Column17", "Column18", "Column19", "Column20"}),
    #"Renamed Columns" = Table.RenameColumns(#"Removed Columns",{{"Date Added", "Created Date"}, {"Pipeline Status", "Pipeline Stage"}}),
    #"Added Custom" = Table.AddColumn(#"Renamed Columns", "Full Location", each [Suburb] & ", South Africa")
in
    #"Added Custom"