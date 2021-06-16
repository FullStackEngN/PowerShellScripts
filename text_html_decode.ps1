$hexString = Get-Content C:\Temp\tmp.txt
$bytes = New-Object -TypeName byte[] -ArgumentList($hexString.Length / 2)

For ($i = 0; $i -lt $hexString.Length; $i += 2) {
    $bytes[$i / 2] = [convert]::ToByte($hexString.Substring($i, 2), 16)
}

$gb2312 = [System.Text.Encoding]::GetEncoding('gb2312')
$utf8 = [System.Text.Encoding]::UTF8

$bytesUTF8 = [System.Text.Encoding]::Convert($gb2312, $utf8, $bytes)

$decoded = [System.Text.Encoding]::UTF8.GetString($bytesUTF8)
Set-Content C:\temp\tmp1.txt -Value $decoded

Write-Host $decoded
