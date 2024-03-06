# Set the Azure subscriptions
$subscriptions = @(
"9d6dd572-2ba7-4702-b624-d82a75cecbf8",
"8bdc268e-9f37-46e4-b512-2f2d550fa334",
"f2714234-0e67-4076-8bbf-0992cd5bafda",
"b528fa61-9429-4966-97d7-e3c31b673563",
"2e871eea-1ba7-4621-bb6e-205c4028b7cf",
"33136b5b-5f3f-4956-9ac9-76551830de57",
"790bc78a-22a9-4cb4-afdf-7cc2b93357fc",
"8492a953-f62a-4f59-a595-05a39c0788d8",
"b30c264f-0880-4df0-9e55-954d81745d4e",
"9b55da92-e93a-42e6-b749-0ced9e8fdf55",
"d34d5607-90f8-4c69-bd22-73ed787facb6",
"dff44d2b-f053-4b4b-b739-ec4bcc91139e",
"146c7cbc-9707-4f48-aef0-abbe9164dca6",
"d13ec01d-c14f-41a0-81a0-6cc30bd5bb5a",
"19f18e66-5a0f-453b-bda5-2eb9699d25bc",
"ea29ca38-4d20-49a3-baf1-9d0ec7c91e1d",
"d91e487f-3189-483a-8e54-f0d7177ba4f6",
"8eacf492-9dd0-4dba-b697-85d818ee7cf5",
"047c8139-9ad2-4ad5-9e90-0960c6a2cc7b",
"f651f147-9d2a-480d-9189-52d3c9bc700e",
"a7cd72e5-516f-46a4-bd61-b7f17a982ee6",
"ab236c1a-4784-4ac2-91af-6ae6eb44394c",
"f920e398-cb53-4c32-af60-f7ead6b1141d",
"ae339f06-92c3-4913-8c9c-c981171974ac",
"b3bac964-f743-4001-84b7-c5238a6fc9bb",
"b59b3a5d-c9a3-4cc2-80dc-da26203cdc52",
"9c24ed4c-e1de-4e0c-8dfd-8774b6fd7b1a",
"b88f91d6-8f95-4f35-8bba-7246af3dc258",
"e4b0b662-fef4-45e1-8101-ffe58ae93f16",
"6595666d-669b-4c77-8811-b79c0d091989",
"63e331a1-4520-4aa6-9440-6c012a024f33",
"7e6aa03f-ecd8-434d-94ff-af8c33991765",
"37195c53-d507-44eb-bb1e-fc5b90780faf",
"8159956f-5919-4f18-908b-418e0d1e332a",
"9dea3541-5386-4614-96c1-f51215e3e84a",
"7a1118bc-f7c6-42ec-8b49-425e7638643f",
"1d2c735d-6bd6-4d4a-86ff-5bebc3233acc",
"ee1dae68-6fc6-4296-984a-3e493e3e208c",
"4fb89d82-e7ae-4c4d-bb12-cb8c764f1644",
"468b9028-fac7-4ccb-8069-741ca175e848",
"f19cf664-8961-4331-9f00-85da7e2c2f25",
"08033baa-5c1e-4e9a-af7c-66f3375ab572",
"6b7f3b54-1a0d-4419-8816-b36ed82d58c5",
"857e0d00-a1f2-4145-a37f-092cf8ea81c1",
"4844aafa-b998-4700-aeaf-9529ee189559",
"f8dc4209-943c-4c33-95eb-11eb5193a8b3",
"b5fbe38f-703a-4c02-ace3-227763a10906",
"36602055-6082-449b-9c27-0864f5f49b01",
"8acc4b30-17f1-42a3-896e-fb91d021f2fa",
"638d5431-b18e-4c89-bd72-38d2a100f5da",
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
"331ff63b-0ee0-4aca-8c6c-8e38b13facc8"

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
