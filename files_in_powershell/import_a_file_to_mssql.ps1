$sqlServer = "localhost"
$sqlDatabase = "webstore"
$sqlTable = "testTable"

$batchSize = 1000

$csvDelimiter = "|"
$csvFile = "FILE_PATH"


[void][Reflection.Assembly]::LoadWithPartialName("System.Data")
[void][Reflection.Assembly]::LoadWithPartialName("System.Data.SqlClient")

$connectionString = "Data Source=$sqlServer;Integrated Security=true;Initial Catalog=$sqlDatabase;"
$bulkCopy = New-Object Data.SqlClient.SqlBulkCopy($connectionString, [System.Data.SqlClient.SqlBulkCopyOptions]::TableLock)


$bulkcopy.DestinationTableName = $sqlTable
$bulkcopy.bulkcopyTimeout = 0
$bulkcopy.batchsize = $batchSize

# create power shell datatable
$powerShellDatatable = New-Object System.Data.DataTable


# handle file
$reader = New-Object System.IO.StreamReader($csvFile) # open the file
$columns = (Get-Content $csvFile -First 1).Split($csvDelimiter) #get file's columns
if ($firstRowColumnNames -eq $true) { $reader.readLine() } #read file's headers

# add columns to the powershell table
foreach ($column in $columns) {   
	$powerShellDatatable.Columns.Add()
}

# read file and insert data to sql
while (($line = $reader.ReadLine()) -ne $null) {  #read the file's data line by line
	$powerShellDatatable.Rows.Add($line.Split($csvDelimiter))
	$i++; 
  if (($i % $batchSize) -eq 0) { #if are in the line 500, 1000, 1500, 2000, 2500, etc meanin we finished a batch, the mod = 0  we will insert
		$bulkCopy.WriteToServer($powerShellDatatable) #write power shell datatable into sql datatable
		$powerShellDatatable.Clear()  #clear power shell datatable
	}  
} 

# insert remaning data to sql if there is any
if($powerShellDatatable.Rows.Count -gt 0) {
	$bulkCopy.WriteToServer($powerShellDatatable)
	$powerShellDatatable.Clear()
}

# close
$reader.Close(); 
$reader.Dispose()
$bulkCopy.Close(); 
$bulkCopy.Dispose()
$powerShellDatatable.Dispose()

# Sometimes the Garbage Collector takes too long to clear the huge datatable.
[System.GC]::Collect()