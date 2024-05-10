$rutaDirectorio = "$env:LOCALAPPDATA\Discord"

$carpetas = Get-ChildItem -Path $rutaDirectorio -Directory | Where-Object { $_.Name -like "app-*" }

foreach ($carpeta in $carpetas) {

    $archivos = Get-ChildItem -Path $carpeta.FullName
    if ($archivos.Count -eq 0) {

        Remove-Item -Path $carpeta.FullName -Force -Recurse
        Write-Output "Carpeta eliminada: $($carpeta.FullName)"
    }
}
