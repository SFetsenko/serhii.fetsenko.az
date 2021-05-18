#New-AzResourceGroupDeployment -Name "new-vnet" -ResourceGroupName "SKILLUP-RG" -TemplateFile .\vnet.json
#New-AzResourceGroupDeployment -Name "new-nsg" -ResourceGroupName "SKILLUP-RG" -TemplateFile .\nsg.json
New-AzResourceGroupDeployment -Name "new-asg2" -ResourceGroupName "SKILLUP-RG" -TemplateFile .\Networking\asg.json -TemplateParameterFile .\Networking\asg.parameters.json