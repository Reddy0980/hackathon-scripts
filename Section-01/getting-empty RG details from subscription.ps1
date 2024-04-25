# Connect to the Azure AD tenant
Connect-AzAccount -TenantId "0b9d902d-e3c1-48f1-8979-365832b339dd"

# Define your Azure subscriptions (replace SubscriptionID1, SubscriptionID2, etc. with your actual subscription IDs)
$subscriptions = @(
"4319b346-9999-4ded-9898-6dd42b97a1dc",
"d56bafe7-a0c7-4511-87ab-405594c336ed",
"d20a6bb1-d2c1-415a-a73c-af36684cf175",
"b0ad4318-7756-4520-859c-7b074929239e",
"b527f3d7-02ca-4bdb-a1aa-309782d75371",
"6848ca93-e15b-4f3c-9068-36800c2c533e",
"47f2c3fc-f49a-4f41-ac99-79c93a4b3ada",
"3ea9e2fa-e841-4ecc-a1d5-73bfa9b11be2",
"182c877b-0502-4f88-9a48-f269b866638a",
"c0dbfba5-da54-480c-bca8-751eb81c687b",
"0fe65256-e6aa-4eca-b2ba-99eee42c9e47",
"97f2aff8-0bef-4d55-b32b-6a61f2c2f6bf",
"a598db8a-507f-41b9-8b1f-6d5875f7dffa",
"851ec435-7967-440f-b453-09de40da60e6",
"b69b5b07-548a-4062-82dd-5c66e5136e1f",
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
"4662f9e0-503c-4709-a465-3af142d24b7d",
"51c7da09-ac17-4e7a-9113-d69cb693dbd1",
"c273133b-0056-44e3-901f-a90cb20e5a12",
"afd712b3-366f-43dc-aa7c-2b4af1da3e5b",
"c7b7e578-f716-45e3-a1f2-00054dab9900",
"bbaedca3-91f1-4371-8d16-99f48d81363e",
"c4126e9b-ed4d-419e-bdb7-3c5f24a83968",
"bcfaf536-ab8b-4485-aafe-33d92bfab46a",
"331ff63b-0ee0-4aca-8c6c-8e38b13facc8",
"b15b2d34-47ff-4716-9137-8df171991763",
"7a6b3356-e874-4967-91f5-aea9f07daec9" 
) 

# Create an empty array to store the results
$results = @()

# Loop through each subscription
foreach ($subscriptionId in $subscriptions) {
    # Connect to the Azure subscription
    Set-AzContext -SubscriptionId $subscriptionId

    # Get a list of all resource groups in the subscription
    $resourceGroups = Get-AzResourceGroup

    # Loop through each resource group
    foreach ($resourceGroup in $resourceGroups) {
        $rgName = $resourceGroup.ResourceGroupName
        $deploymentCount = (Get-AzResourceGroupDeployment -ResourceGroupName $rgName -ErrorAction SilentlyContinue).Count
        
        # Check if the resource group has no deployments
        if ($deploymentCount -eq 0) {
            # Check if the resource group has no resources
            $resources = Get-AzResource -ResourceGroupName $rgName -ErrorAction SilentlyContinue
            if (-not $resources) {
                # Add the details to the results array
                $result = [PSCustomObject]@{
                    SubscriptionId = $subscriptionId
                    ResourceGroupName = $rgName
                }
                $results += $result
            }
        }
    }
}

# Export the results to a CSV file
$results | Export-Csv -Path "C:\Users\AnnapureddiNagireddy\Downloads\emptyrgs.csv" -NoTypeInformation
