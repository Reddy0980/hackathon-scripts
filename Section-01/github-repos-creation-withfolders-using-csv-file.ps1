#gh auth login  ---using github cli login
#powershell.exe -File (location)   --- to execute the ps1 file
# Replace 'YourOrganization' with your GitHub organization name
$organizationName = 'Wells-Fargo-Global-Hackathon'

# Read team names from CSV file
$teams = Import-Csv 'teams.csv' | ForEach-Object { $_.TeamName }

foreach ($team in $teams) {
    $repoName = $team.ToLower()

    # Create private repository using GitHub CLI
    gh repo create "$organizationName/$repoName" --private --confirm

    # Wait for a few seconds to ensure repository creation
    Start-Sleep -Seconds 5

    # Read repository names from CSV file
    $repos = @($repoName)

    foreach ($repoName in $repos) {
        # Clone the repository
        git clone "https://github.com/$organizationName/$repoName.git"
        cd $repoName

        # Create an initial commit
        echo "# Initial Commit" | Out-File README.md
        git add README.md
        git commit -m "Initial commit"
        git push origin main

        # Create folders in the repository
        $folders = @('artifacts/design', 'artifacts/playbook', 'artifacts/demo_presentation', 'artifacts/test_results', 'code')

        foreach ($folder in $folders) {
            # Create the folder
            New-Item -ItemType Directory -Path $folder -Force | Out-Null

            # Create README file in the folder
            echo "# $folder" | Out-File "$folder/README.md"

            # Stage, commit, and push changes
            git add .
            git commit -m "Create $folder folder and README"
            git push origin main
        }

        Write-Output "Folders and README files created successfully in repository '$repoName'."
    }
}
