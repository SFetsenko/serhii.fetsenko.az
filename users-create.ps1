$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = "<password>"
$users = "admin", "dev1", "dev2", "deploy", "guest"
foreach ($user in $users) {
    New-AzureADUser -DisplayName $user -PasswordProfile $PasswordProfile -UserPrincipalName "$user@serhiifetsenko.onmicrosoft.com" -AccountEnabled $true -MailNickName $user   
    }
