$PsswdGenerate = [System.Web.Security.Membership]::GeneratePassword(12,2)
$keyvault = "kv-serhii-fetsenko"
$rgName = "SKILLUP-RG"
$location = "westus"
$servername = "sqlserver-01-serhii-fetsenko"
#$size = "Standard_D1"
$username = "sqladmin"
#$dbname = "database-01"

$SQLAdminSecurePassword = ConvertTo-SecureString $PsswdGenerate -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($username, $SQLAdminSecurePassword);

New-AzSqlServer -ResourceGroupName $rgName -Location $location -ServerName $servername -SqlAdministratorCredentials $Credential
#New-AzSqlDatabase -ResourceGroupName $rgName -ServerName $servername -DatabaseName $dbname

Set-AzKeyVaultSecret -VaultName $keyvault -Name $servername -SecretValue $VMLocalAdminSecurePassword -Tag @{username = $username;}