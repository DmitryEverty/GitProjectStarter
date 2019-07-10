Set-Alias -Name nlp -Value newLocalProject

function global:newGitProject {

    # Variables
    $ProjectName = $args[0]
    $ParrentDir = Get-Location
    $PathToNewProject = -join ($ParrentDir,"\", $ProjectName)

    # Text Output For Debuging
    Write-Output "Your Project is called: $ProjectName in a folder $PathToNewProject"

    # Operations
    New-Item -ItemType Directory $PathToNewProject # Creating new folder inside
    Set-Location -Path $PathToNewProject # Open powershell in newly Created folder
    New-Item -Path . -Name "README.md" -ItemType "File" -Value "# $ProjectName"
    New-Item -Path . -Name ".gitignore" -ItemType "File"
    git init
    git add .
    git commit -m "Starting"
    hub create -d "My new project"
    git push origin master
    git push
    code .
}

function global:newLocalProject {

    # Variables
    $ProjectName = $args[0]
    $ParrentDir = Get-Location
    $PathToNewProject = -join ($ParrentDir,"\", $ProjectName)

    # Text Output For Debuging
    Write-Output "Your Project is called: $ProjectName in a folder $PathToNewProject"

    # Operations
    New-Item -ItemType Directory $PathToNewProject # Creating new folder inside
    Set-Location -Path $PathToNewProject # Open powershell in newly Created folder
    New-Item -Path . -Name "README.md" -ItemType "File" -Value "# $ProjectName"
    New-Item -Path . -Name ".gitignore" -ItemType "File"
    git init
    git add .
    git commit -m "Starting"
    code .
}

function global:UploadToGit {
    $ParrentDir = Get-Location
    $ThisFolderName = Get-Location | Select-Object | ForEach-Object{$_.ProviderPath.Split("\")[-1]}
    Write-Output "$ParrentDir and $ThisFolderName"

    New-Item -Path . -Name "README.md" -ItemType "File" -Value "# $ThisFolderName"
    New-Item -Path . -Name ".gitignore" -ItemType "File"

    git init
    git add .
    git commit -m "Starting"
    hub create -d "My already created project"
    git push origin master
    git push
}