# Import the CSV file containing user object IDs and passwords
$csvPath = "C:\Users\AnnapureddiNagireddy\Downloads\ibm-password.csv"
$users = Import-Csv -Path $csvPath

# Connect to Azure AD
Connect-AzureAD -TenantId "0b9d902d-e3c1-48f1-8979-365832b339dd"

# Loop through each user in the CSV file
foreach ($user in $users) {
    $objectId = $user.ObjectId
    $password = $user.Password

    # Convert the plain text password to a secure string
    $securePassword = ConvertTo-SecureString -String $password -AsPlainText -Force

    # Set the password for the user
    Set-AzureADUserPassword -ObjectId $objectId -Password $securePassword

    Write-Output "Password set for user with Object ID: $objectId"
}
