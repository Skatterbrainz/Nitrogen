function ConvertTo-NitrogenDiagnosisJson {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[AllowEmptyCollection()]
		[AllowNull()]
		[object[]]$InputItems
	)

	$normalized = @()
	foreach ($item in $InputItems) {
		if ($item -isnot [string]) {
			$normalized += $item
			continue
		}

		$text = $item.Trim()
		if ([string]::IsNullOrWhiteSpace($text)) {
			$normalized += [pscustomobject]@{ rawText = $item }
			continue
		}

		$candidate = $text
		if ($candidate -match '(?s)```(?:json)?\s*(.+?)\s*```') {
			$candidate = $matches[1].Trim()
		}

		try {
			$normalized += ($candidate | ConvertFrom-Json -ErrorAction Stop)
		}
		catch {
			$normalized += [pscustomobject]@{ rawText = $item }
		}
	}

	return $normalized
}
