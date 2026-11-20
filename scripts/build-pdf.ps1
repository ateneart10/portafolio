# Genera public/chris-torres-portafolio.pdf desde pdf/portafolio.html con Chrome o Edge en modo headless.
# Uso: powershell -File scripts/build-pdf.ps1 -SiteUrl "https://chris-torres.pages.dev"
param(
  [string]$SiteUrl = "https://chris-torres.pages.dev"
)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$src = Join-Path $root 'pdf\portafolio.html'
$tmp = Join-Path $root 'pdf\_render.html'
$out = Join-Path $root 'public\chris-torres-portafolio.pdf'

$label = $SiteUrl -replace '^https?://', '' -replace '/$', ''
$html = [IO.File]::ReadAllText($src, [Text.Encoding]::UTF8)
$html = $html.Replace('{{SITE_URL}}', $SiteUrl).Replace('{{SITE_URL_LABEL}}', $label)
[IO.File]::WriteAllText($tmp, $html, (New-Object Text.UTF8Encoding($false)))

$browsers = @(
  "$env:ProgramFiles\Google\Chrome\Application\chrome.exe",
  "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe",
  "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe",
  "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe"
)
$exe = $browsers | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $exe) { throw 'No se encontró Chrome ni Edge.' }

$profileDir = Join-Path $env:TEMP 'pdf-render-profile'
$uri = ([Uri]$tmp).AbsoluteUri
$argList = @('--headless=new', '--disable-gpu', '--no-first-run', "`"--user-data-dir=$profileDir`"",
          '--no-pdf-header-footer', '--virtual-time-budget=15000', "`"--print-to-pdf=$out`"", $uri)
$p = Start-Process -FilePath $exe -ArgumentList $argList -Wait -PassThru -NoNewWindow
Remove-Item $tmp -ErrorAction SilentlyContinue
if (-not (Test-Path $out)) { throw "No se generó el PDF (exit $($p.ExitCode))." }
Write-Output ("PDF generado: {0} ({1:N0} KB)" -f $out, ((Get-Item $out).Length / 1KB))
