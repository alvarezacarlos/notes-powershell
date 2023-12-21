$sqlServer = $args[0]
$sqlDatabase = $args[1]

$sqlTable = $args[2] #file_name arg is the same string as the table_name created in sql by the python script
$files_path = $args[3]
$csvDelimiter = "|"

$batchSize = 1000 #bulk of 1000 rows

[void][Reflection.Assembly]::LoadWithPartialName("System.Data")
[void][Reflection.Assembly]::LoadWithPartialName("System.Data.SqlClient")

$connectionString = "Data Source=$sqlServer;Integrated Security=true;Initial Catalog=$sqlDatabase;"

try {
	$bulkCopy = New-Object Data.SqlClient.SqlBulkCopy($connectionString, [System.Data.SqlClient.SqlBulkCopyOptions]::TableLock)

	$bulkcopy.DestinationTableName = $sqlTable
	$bulkcopy.bulkcopyTimeout = 0
	$bulkcopy.batchsize = $batchSize

	# create power shell datatable
	$powerShellDatatable = New-Object System.Data.DataTable

	try {
		# handle file
		$reader = New-Object System.IO.StreamReader($files_path) # open the file
		$columns = (Get-Content $files_path -First 1).Split($csvDelimiter) #get file's columns
		if ($firstRowColumnNames -eq $true) { $null = $reader.readLine() } #read file's headers

		# add columns to the powershell table
		foreach ($column in $columns) {   
			$null = $powerShellDatatable.Columns.Add()
		}

		# read file and insert data to sql
		while (($line = $reader.ReadLine()) -ne $null) {  #read the file's data line by line
			$null = $powerShellDatatable.Rows.Add($line.Split($csvDelimiter))
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
	}
	catch {		
		Write-Host $_.Exception.Message -ForegroundColor Red
	}

	$bulkCopy.Close(); 
	$bulkCopy.Dispose()
	$powerShellDatatable.Dispose()

	# Sometimes the Garbage Collector takes too long to clear the huge datatable.
	[System.GC]::Collect()
}
catch {	
	Write-Host $_.Exception.Message -ForegroundColor Red
}
