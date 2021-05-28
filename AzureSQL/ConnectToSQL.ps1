#Connect-AzAccount
#Install-module -Name SqlServer -Scope CurrentUser
$rg="SKILLUP-RG"
$keyVaultName = "kv-serhii-fetsenko"
$sqlServerName = "sqlserver-01-serhii-fetsenko"
$database = "master"
$adminName = "sqladmin"
$newUserName = "dbadmin"

$serverFQDN = (Get-AzSqlServer -ResourceGroupName $rg -ServerName $SqlServerName).FullyQualifiedDomainName
$adminPassword = Get-AzKeyVaultSecret -VaultName $KeyVaultName -Name $SqlServerName -AsPlainText
$server = "$ServerFQDN,1433"

$connectionString = "Server=$server;Database=$database;User ID=$adminName;Password=$adminPassword;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
$connection = New-Object -TypeName System.Data.SqlClient.SqlConnection($connectionString)

$queryPath = ".\AzureSQL\CreateUser.sql"
$query = [System.IO.File]::ReadAllText($queryPath)

$command = New-Object -TypeName System.Data.SqlClient.SqlCommand($query, $connection)

$username = New-Object -TypeName System.Data.SqlClient.SqlParameter("@Username", $newUserName)
$password = New-Object -TypeName System.Data.SqlClient.SqlParameter("@Password", $adminPassword)

$command.Parameters.Add($username)
$command.Parameters.Add($password)

$connection.Open()
$command.ExecuteNonQuery()
$connection.Close()