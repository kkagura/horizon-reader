param(
  [string]$ImageName = "horizon-reader/horizon",
  [string]$ImageTag = "latest",
  [string]$WorkDir = ".horizon-build",
  [string]$Output = "horizon-image.tar"
)

$ErrorActionPreference = "Stop"

$RepoUrl = "https://github.com/Thysrael/Horizon.git"
$RepoDir = Join-Path $WorkDir "Horizon"
$Image = "${ImageName}:${ImageTag}"

New-Item -ItemType Directory -Force -Path $WorkDir | Out-Null

if (Test-Path (Join-Path $RepoDir ".git")) {
  Write-Host "Updating Horizon source..."
  git -C $RepoDir pull --ff-only
}
else {
  Write-Host "Cloning Horizon source..."
  git clone $RepoUrl $RepoDir
}

Write-Host "Building Docker image: $Image"
docker build -t $Image $RepoDir

Write-Host "Saving Docker image to: $Output"
docker save -o $Output $Image

Write-Host "Done."
Write-Host "Upload these files to the server:"
Write-Host "  $Output"
Write-Host "  env.example"
Write-Host "  config.example.json"
Write-Host "  server-run.sh"

