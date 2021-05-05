New-AzResourceGroupDeployment -Name "new-vnet" -ResourceGroupName "SKILLUP-RG" -TemplateFile .\vnet.json
New-AzResourceGroupDeployment -Name "new-nsg" -ResourceGroupName "SKILLUP-RG" -TemplateFile .\nsg.json
New-AzResourceGroupDeployment -Name "new-asg" -ResourceGroupName "SKILLUP-RG" -TemplateFile .\asg.json