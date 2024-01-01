# Wes Bell
# November 16th
# Powershell

# this is the menu that shows up on the screen
function Show-Menu {
    cls
    Write-Host "1. List details of the local PC inside the shell"
    Write-Host "2. List details of the local PC to a window in grid view"
    Write-Host "3. List details of the local PC to a file named PCInventory"
    Write-Host "4. List details of the Local OS in a window in grid view"
    Write-Host "5. List details of the local hard drive in grid view"
    Write-Host "6. Exit"
}

#creats pc details on screen
function PCDetails {
    Get-WmiObject Win32_ComputerSystem | Format-Table -AutoSize
    Start-Sleep -Seconds 5
}

# creates PC details in grid view
function PCDetails-GridView {
    Get-WmiObject Win32_ComputerSystem | Out-GridView
    Start-Sleep -Seconds 5
}

# creates PC details to a file
function PCDetailsToFile {
    Get-WmiObject Win32_ComputerSystem | Out-File -FilePath "C:\Users\wesbe\Desktop\PCInventory.txt"
    Write-Host "PC details saved to PCInventory.txt"
    Start-Sleep -Seconds 5
}

# creates OS details in gridview
function OSDetails-GridView {
    Get-WmiObject Win32_OperatingSystem | Out-GridView
    Start-Sleep -Seconds 5
}

# creates local hard drive detials in grid view
function LocalHardDriveDetails {
    Get-WmiObject Win32_LogicalDisk | Out-Gridview
    Start-Sleep -Seconds 5
}

# Main menu section
# calls the response you choose
do {
    Show-Menu
    $choice = Read-Host "Enter your choice"

    switch ($choice) {
        1 { PCDetails }
        2 { PCDetails-GridView }
        3 { PCDetailsToFile }
        4 { OSDetails-GridView }
        5 { LocalHardDriveDetails }
        6 { break }
        default { Write-Host "Invalid choice. Please enter a valid option." }
    }

} while ($choice -ne 6)
