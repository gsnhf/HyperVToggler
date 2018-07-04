if((Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All).State -eq "Enabled") {
	Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
} else {
	Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
}

Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
