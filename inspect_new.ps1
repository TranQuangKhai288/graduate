Add-Type -AssemblyName System.Drawing
$dir = 'f:\gradu\images'
$files = Get-ChildItem -Path $dir -Filter '1784693982*.jpg'
$results = @()
foreach ($f in $files) {
    try {
        $img = [System.Drawing.Image]::FromFile($f.FullName)
        $orient = 'square'
        if ($img.Width -gt ($img.Height * 1.1)) { $orient = 'landscape' }
        elseif ($img.Height -gt ($img.Width * 1.1)) { $orient = 'portrait' }
        $obj = [PSCustomObject]@{
            Name = $f.Name
            SizeKB = [math]::Round($f.Length / 1KB)
            Width = $img.Width
            Height = $img.Height
            Aspect = [math]::Round($img.Width / $img.Height, 2)
            Type = $orient
        }
        $results += $obj
        $img.Dispose()
    } catch {
        Write-Host "Error reading $($f.Name)"
    }
}
$results | Sort-Object -Property SizeKB -Descending | Format-Table -AutoSize
