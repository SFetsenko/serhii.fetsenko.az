#New-AzResourceGroupDeployment -Name "new-vnet" -ResourceGroupName "SKILLUP-RG" -TemplateFile .\vnet.json
#New-AzResourceGroupDeployment -Name "new-nsg" -ResourceGroupName "SKILLUP-RG" -TemplateFile .\nsg.json
Connect-AzAccount
New-AzResourceGroupDeployment -Name "new-sql" -ResourceGroupName "SKILLUP-RG" -TemplateFile .\AzureSQL\AzureSQLServer.json -TemplateParameterFile .\AzureSQL\AzureSQLServer.parameters.json