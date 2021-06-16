$gzipHex = Get-Content C:\Temp\tmp.txt
$bytes = New-Object -TypeName byte[] -ArgumentList($gzipHex.Length / 2)
for ($i = 0; $i -lt $gzipHex.Length; $i += 2) {
   $bytes[$i / 2] = [Convert]::ToByte($gzipHex.Substring($i, 2), 16)
}

$ms = New-Object IO.MemoryStream(, $bytes)
$gzs = New-Object IO.Compression.GzipStream($ms, [IO.Compression.CompressionMode]::Decompress)
$sr = New-Object IO.StreamReader($gzs, [Text.Encoding]::UTF8)
$decoded = $sr.ReadToEnd();

[regex]::UnEscape($decoded)

Set-Content C:\temp\tmp1.txt -Value $decoded

Write-Host $decoded
