# {
#     "Param1": "A",
#     "Param2" : "B",
#     "Param3" : "C"
# }


$Results = Get-Content -Raw  -Path .\variables.json | ConvertFrom-Json

Write-Output $Results.GetType()
Write-Output "object : " $Results
$Hash_table = @{}

$Results.psobject.Properties | ForEach-Object {
    if ($_.Name -ne "Param1" -and $_.Name -ne "Param2" ) {
        $Hash_table[$_.Name] = $_.Value
    }
}
Write-Output "HashTable : " $Hash_table

Update-AzFunctionAppSetting -Name <FUNCTION_APP_NAME> -ResourceGroupName <RESOURCE_GROUP_NAME> -AppSetting $Hash_table