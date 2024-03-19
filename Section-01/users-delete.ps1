# Import the CSV file containing RG names, user names, and subscription IDs
$csvPath = "C:\Users\AnnapureddiNagireddy\Downloads\users-delete-wf.csv"  # Update with your CSV file path

# Import the CSV file
$users = Import-Csv -Path $csvPath

# Connect to Azure AD for the specific tenant
Connect-AzAccount -TenantId "0b9d902d-e3c1-48f1-8979-365832b339dd" # Replace "your-tenant-id" with the ID of the "cloud.events.ai" tenant

# Loop through each user and delete them
foreach ($user in $users) {
    $upn = $user.UPN

    # Check if the user exists
    $existingUser = Get-AzADUser -UserPrincipalName $upn -ErrorAction SilentlyContinue

    if ($existingUser) {
        # Remove the user
        Remove-AzADUser -UserPrincipalName $upn
        Write-Output "User '$upn' has been deleted."
    } else {
        Write-Output "User '$upn' not found. Skipping deletion."
    }
}

Write-Output "User deletion process completed."



