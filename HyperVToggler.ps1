$state = (Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All).State

Write-Host Hyper-V state is $state

if ($state -eq "Enabled") {
    Write-Host Disable Hyper-V?
}
else {
    Write-Host Enable Hyper-V?
}

$message = 'Change Hyper-V state?'
$question = 'Are you sure you want to proceed? Computer will be restarted.'

$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))

$decision = $Host.UI.PromptForChoice($message, $question, $choices, 1)
if ($decision -eq 0) {
    if ($state -eq "Enabled") {
		Write-Host 'Disable Hyper-V'
		Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
    }
    else {
		Write-Host 'Enable Hyper-V'
		Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
    }
}
else {
    Write-Host 'Cancelled'
}
