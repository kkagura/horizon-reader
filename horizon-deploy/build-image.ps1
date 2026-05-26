param(
  [string]$ImageName = "horizon-reader/horizon",
  [string]$ImageTag = "latest",
  [string]$HorizonGitUrl = "https://github.com/Thysrael/Horizon.git",
  [string]$HorizonRef = "main",
  [string]$Output = "horizon-image.tar"
)

$ErrorActionPreference = "Stop"

$Image = "${ImageName}:${ImageTag}"
$RemoteContext = "${HorizonGitUrl}#${HorizonRef}"

Write-Host "Building Docker image: $Image"
Write-Host "Docker context: $RemoteContext"
docker build -t $Image $RemoteContext

Write-Host "Applying Doubao response_format compatibility patch..."
docker build -f Dockerfile.doubao-patch -t $Image .

Write-Host "Saving Docker image to: $Output"
docker save -o $Output $Image

Write-Host "Done."
Write-Host "Upload these files to the server:"
Write-Host "  $Output"
Write-Host "  server-run.sh"
Write-Host "  .env"
Write-Host "  data/config.json"
