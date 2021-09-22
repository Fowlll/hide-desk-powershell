$DesktopPath = [Environment]::GetFolderPath("Desktop");
$sourceFolder = "$DesktopPath\";
$targetFolder = "$DesktopPath\hide";

if(-Not (Test-Path "$DesktopPath/hide")){
    mkdir "$DesktopPath/hide";
}

if($args[0] -match "unhide"){
    $sourceFolder = "$DesktopPath\hide\";
    $targetFolder = "$DesktopPath\";
}


$allFile = Get-ChildItem $sourceFolder | select -ExpandProperty FullName;

foreach ($file in $allFile){
    if(-Not ($file -eq "$targetFolder")){
        Move-Item "$file" "$targetFolder";
    }
}