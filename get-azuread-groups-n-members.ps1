#Exports to csv all AD groups and it's members

Connect-AzureAD

foreach ($group in Get-AzureADGroup -All $true){
    Write-Host $group.ObjectId
    $Path = $group.DisplayName + ".csv"
    Get-AzureADGroup -ObjectId $group.ObjectId | Get-AzureADGroupMember -All $True | Export-Csv -Path .\$Path -NoTypeInformation
}

Read-Host -Prompt "Press Enter to exit"
