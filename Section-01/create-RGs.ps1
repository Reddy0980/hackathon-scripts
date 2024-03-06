# Set the Azure subscriptions
$subscriptions = @(
    "5f9a5bf2-86d1-4fb8-b22e-d63d6d9374b3"
    # "Subscription2_ID"
    # Add the subscription IDs for all 88 subscriptions
    # ...
    # "Subscription88_ID"
)

# Set the common parameters
$location = "East US"  # Set your desired Azure region
$resourceGroupPrefix = "Team-"  # You can customize the prefix as needed

# Loop through each subscription
foreach ($subscriptionId in $subscriptions) {
    # Connect to the Azure subscription
    Connect-AzAccount -Subscription $subscriptionId

    # Determine the starting index for the resource groups
    $startIndex = 1 + (($subscriptions.IndexOf($subscriptionId)) * 5)

    # Create 5 resource groups in the subscription
    for ($i = 1; $i -le 5; $i++) {
        $resourceGroupName = "$resourceGroupPrefix$($startIndex + $i - 1)"
        New-AzResourceGroup -Name $resourceGroupName -Location $location -Force
        Write-Output "Resource group '$resourceGroupName' created in subscription '$subscriptionId'."
    }
}

Write-Output "Resource groups creation completed for all subscriptions."
