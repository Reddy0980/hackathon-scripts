# Import the CSV file containing RG names, user names, and subscription IDs
$csvPath = "C:\Users\AnnapureddiNagireddy\Downloads\users-assign-ws.csv"  # Update with your CSV file path
$assignments = Import-Csv -Path $csvPath

# Connect to the Azure AD tenant
Connect-AzAccount

# Loop through each assignment
foreach ($assignment in $assignments) {
    $rgName = $assignment.RgName
    $userName = $assignment.UserName
    $subscriptionId = $assignment.SubscriptionId

    # Get the Azure AD object ID of the user
    $userObjectId = (Get-AzADUser -UserPrincipalName $userName).Id

    # Connect to the Azure subscription
    Set-AzContext -SubscriptionId $subscriptionId

    # Get the Azure resource group
    $resourceGroup = Get-AzResourceGroup -Name $rgName -ErrorAction SilentlyContinue

    # If resource group exists, assign the user as a contributor
    if ($resourceGroup) {
        $roleAssignment = New-AzRoleAssignment -ObjectId $userObjectId -RoleDefinitionName "Contributor" -ResourceGroupName $resourceGroup.ResourceGroupName

        Write-Output "User '$userName' assigned as Contributor to resource group '$rgName' in subscription '$subscriptionId'."
    }
    else {
        Write-Output "Resource group '$rgName' not found in subscription '$subscriptionId'. Skipping user assignment."
    }
}

Write-Output "User assignments completed."
