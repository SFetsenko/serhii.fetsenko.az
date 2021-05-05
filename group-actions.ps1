$group = Get-AzureADGroup | Where-Object {$_.DisplayName -eq "Admins"}
$user = Get-AzureADUser | Where-Object {$_.DisplayName -match "mr.fec"}
#Add-AzureADGroupOwner -ObjectId $group.ObjectId -RefObjectId $user.ObjectId
Add-AzureADGroupMember -ObjectId $group.ObjectId -RefObjectId $user.ObjectId