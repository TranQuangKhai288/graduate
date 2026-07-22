$dir = 'f:\gradu\images'

# Remove old bg_ and moment_ files
Remove-Item (Join-Path $dir 'bg_*.jpg') -Force -ErrorAction SilentlyContinue
Remove-Item (Join-Path $dir 'moment_*.jpg') -Force -ErrorAction SilentlyContinue

$bgMap = @{
    '1784693982652_3015737910999690742_3015737910999690742_a27d57ac3ffaf071afadad41225ccb04.jpg' = 'bg_1.jpg'
    '1784693982698_3015737910999690742_3015737910999690742_46792b65249c8488f8a7a26f4a18dd07.jpg' = 'bg_2.jpg'
    '1784693982712_3015737910999690742_3015737910999690742_3cb189c27cef7bc7c5e59df2eb7c3cde.jpg' = 'bg_3.jpg'
    '1784693982723_3015737910999690742_3015737910999690742_bda46c89fa166958f3043a228e04bbf2.jpg' = 'bg_4.jpg'
    '1784693982684_3015737910999690742_3015737910999690742_1239f753850a7eeabfac8222b00209fa.jpg' = 'bg_5.jpg'
}

$momentMap = @{
    '1784693982698_3015737910999690742_3015737910999690742_46792b65249c8488f8a7a26f4a18dd07.jpg' = 'moment_01.jpg'
    '1784693982723_3015737910999690742_3015737910999690742_bda46c89fa166958f3043a228e04bbf2.jpg' = 'moment_02.jpg'
    '1784693982652_3015737910999690742_3015737910999690742_a27d57ac3ffaf071afadad41225ccb04.jpg' = 'moment_03.jpg'
    '1784693982684_3015737910999690742_3015737910999690742_1239f753850a7eeabfac8222b00209fa.jpg' = 'moment_04.jpg'
    '1784693982733_3015737910999690742_3015737910999690742_652fed2ba4076d5a50158411157a8f21.jpg' = 'moment_05.jpg'
    '1784693982742_3015737910999690742_3015737910999690742_8b2483fc6ffdba92e0af6574c5a416cb.jpg' = 'moment_06.jpg'
    '1784693982750_3015737910999690742_3015737910999690742_29a17edacc252a176f7f2afb777e4234.jpg' = 'moment_07.jpg'
    '1784693982712_3015737910999690742_3015737910999690742_3cb189c27cef7bc7c5e59df2eb7c3cde.jpg' = 'moment_08.jpg'
}

foreach ($item in $bgMap.GetEnumerator()) {
    $src = Join-Path $dir $item.Key
    $dst = Join-Path $dir $item.Value
    if (Test-Path $src) {
        Copy-Item $src $dst -Force
        Write-Host "Copied $($item.Key) -> $($item.Value)"
    }
}

foreach ($item in $momentMap.GetEnumerator()) {
    $src = Join-Path $dir $item.Key
    $dst = Join-Path $dir $item.Value
    if (Test-Path $src) {
        Copy-Item $src $dst -Force
        Write-Host "Copied $($item.Key) -> $($item.Value)"
    }
}

Get-ChildItem $dir -Filter 'bg_*.jpg'
Get-ChildItem $dir -Filter 'moment_*.jpg'
