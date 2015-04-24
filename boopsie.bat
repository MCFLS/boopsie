REM delete whatever old file exists
DEL "C:\scripts\boopsie\*.*" /Q
REM Run the sqlworkbench scripts to create the new Boopsie file.
java -jar C:\SQLWorkbench\sqlworkbench.jar script='c:/scripts/boopsie.sql' -profile=CountyCat -showProgress=true
REM Compress file with 7zip
CD C:\7za920
7za a "C:\scripts\boopsie\catalog_extract_full.7z" "C:\scripts\boopsie\catalog_extract_full.txt"
REM Run winscp to ftp the files over to Boopsie
winscp.com /command "option batch abort" "option confirm off" "open boopsie" "put C:\scripts\boopsie\catalog_extract_full.7z" "exit"
