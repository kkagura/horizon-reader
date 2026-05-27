param(
  [string]$ImageName = "horizon-reader/web",
  [string]$ImageTag = "latest",
  [string]$Output = "reader-image.tar"
)

$ErrorActionPreference = "Stop"

$Image = "${ImageName}:${ImageTag}"

Write-Host "Building Docker image: $Image"
docker build -t $Image .

Write-Host "Saving Docker image to: $Output"
docker save -o $Output $Image

Write-Host "Done."
Write-Host "Upload these files to the server:"
Write-Host "  $Output"
Write-Host "  reader-server-run.sh"
