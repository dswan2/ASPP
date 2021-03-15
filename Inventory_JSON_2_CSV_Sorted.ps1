# Variables
$filter = 50
$inputfile = "Inventory.json"
$outputfile = "Inventory.csv"

# Cleanup
Write-Host "`nRemoving previous outputfile $outputfile ...`n"

# Read Json file and convert to Hash
Write-Host "Reading input file $inputfile ...`n"
$inventory = Get-Content -path $inputfile |ConvertFrom-Json -AsHashtable

# Let's sort our Hash by Name
$inventory_sorted = $inventory.GetEnumerator() | Sort-Object  -Property Name

# Filter based on $filter
$inventory_filtered =  $inventory_sorted | Where-Object {[int32]$_.Value -gt $filter}

# Debug
#$inventory_filtered

# Let's write it out to a csv
Write-Host "Outputting to file $outputfile ....`n"
$inventory_filtered | Select-Object Name,Value | Export-Csv -Path .\$outputfile -NoTypeInformation 


