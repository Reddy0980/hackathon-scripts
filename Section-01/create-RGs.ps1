# Set the Azure subscriptions
Connect-AzAccount

$subscriptions = @(
"67123de6-a844-4251-a664-119d6d87cef4",
"44470cc8-dfd1-4891-908d-3a5c1c8c2679",
"a384ea63-ff2e-4d47-9ca6-04948173a620",
"9c8172e5-fc5b-4582-8271-fbc05298caf2",
"3b30c2b7-21b5-4ec5-abc0-e6ba3da6e3cf",
"86ef8b80-08f8-4feb-91cb-4b69fe6aba6d",
"becf301f-8aeb-4ce4-89b6-abe4775c7a59",
"c452acc8-a47a-49f1-801d-ecf1d378fc6d",
"76a80900-9468-4d78-8d2f-6b5d9f05bcac",
"3f7b0816-237e-4c34-879b-bc9e4bb735c0",
"0e2c7c2c-7ea8-4300-8743-a896105d0b8e",
"65215e07-bfe2-4539-8f4e-1ffb38db2f4d",
"6cd17c96-524e-41af-ba61-5003bda1052a",
"16255075-a4de-4bf7-925c-2f758b99a747",
"4662f9e0-503c-4709-a465-3af142d24b7d"  


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
    Set-AzContext -SubscriptionId $subscriptionId

    # Determine the starting index for the resource groups
    $startIndex = 326 + (($subscriptions.IndexOf($subscriptionId)) * 5)

    # Create 5 resource groups in the subscription
    for ($i = 1; $i -le 5; $i++) {
        $resourceGroupName = "$resourceGroupPrefix$($startIndex + $i - 1)"
        New-AzResourceGroup -Name $resourceGroupName -Location $location -Force
        Write-Output "Resource group '$resourceGroupName' created in subscription '$subscriptionId'."
    }
     # Sleep for 10 seconds before processing the next subscription
     Start-Sleep -Seconds 10
}

Write-Output "Resource groups creation completed for all subscriptions."
