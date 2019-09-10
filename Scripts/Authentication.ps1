# This script demonstrates different methods of authentication to your BC container
# The -auth flag is Windows by default and prompts you for your Windows user password.
# By specifying -auth as "NavUserPassword", you can add a specific username/password 
# combination for your container.
# The -Credential flag specifies a username and a password, which can be done via various
# methods as demonstrated here.

# Define variables
$imageName = "mcr.microsoft.com/businesscentral/sandbox:dk"
$containerName = "auth"

# Credential method 1 (ask user to enter values)
#if ($credential -eq $null -or $credential -eq [System.Management.Automation.PSCredential]::Empty) {
#    $credential = Get-Credential -UserName "admin" -Message "Enter NAV Super User Credentials"
#}

# Credential method 2 (predefined password)
$securePassword = ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential -argumentList "admin", $securePassword

# Create new container
New-NavContainer -accept_eula `
                 -containerName $containerName `
                 -auth NavUserPassword `
                 -imageName $imageName `
                 -Credential $credential `
                 -updateHosts