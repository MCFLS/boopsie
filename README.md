Both SQL Workbench /J and WINSCP offer a command line interface which makes it easy to work with both applications to send the file to Boopsie using a Windows batch file.  Please note I only export bib record number, title, author, publisher, year, format and ISBN to Boopsie, NOT the full record.  I also automatically compress the file with 7zip per Boopsie's instructions

DOWNLOAD APPLICATIONS

1. Download SQL Workbench /J to your computer: http://www.sql-workbench.net/downloads.html

2. Download WINSCP FTP client: http://winscp.net/eng/download.php

3. Download 7zip compression software: http://www.7-zip.org/download.html 

SET UP PROFILES FOR APPLICATIONS

4. Set up a connection profile in SQL Workbench /J to connect to your Sierra SQL instance.  Make sure a connection can be made to your database.  My connection info is attached as separate images under the ISSUES tab (main profile connection and extended properties window).

5. Set up a connection profile in WINSCP to connect to Boopsie.  

6. Record both profile names.  You will need these to alter the SQL and batch files.

Edit file 'boopsie.sql'

7. Replace -file parameter with the location you where you want to store the file created.  I remove this file prior to creating the new one each time the batch file is run.

Edit file 'boopsie.bat'

8. Change profile name used by SQL Workbench /J from "-profile=CountyCat" to "-profile=[your profile name in step 4]"

9. Change profile name used by WINSCP from "open boopsie" to "open [your profile name in step 5]"

Save both files boopsie.bat and boopsie.sql

Run boopsie.bat to execute the query and send file to Boopsie FTP server

