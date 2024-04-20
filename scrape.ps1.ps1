Write-Host "welcome to the creation of Anureet Pannu"
$url = Read-Host "copy and paste the url of the web page you would like to scrape"
#enlisting the users about how they can use the given script
Write-Host "what would you like to scrape from the website you just entered?"
Write-Host "we have a list of services that we provide, select the one that you may prefer:"
write-host " press 1 for all the links on the page"
Write-Host "press 2 for images"

$value = Read-Host "enter your choice of scrapping"
switch($value){
'1'{
links -url $url
}
'2'{
images -url $url
}

default{
Write-Host "invalid choice :("
}
}


function links{
    param ($url)
    
    $content = Invoke-WebRequest -Uri $url  #invoking a request to the server for html source code
    $link = $content.Links|Select-Object -ExpandProperty href
   
    $link | Out-File -FilePath "links_in web.csv"  #saves the links found in the webpage to a CSV file to keep a written record of it in the database.
  Write-Host "your links have been saved in a csv file named Links in your current working directory" #you can see your excel file saved in your current working directory.
    
    }
function images{
param($url)
$content = Invoke-WebRequest -uri $url
$content.images |select -ExpandProperty src #extraction of all the images
$image = $content.images |select -ExpandProperty src
$image| Out-File -FilePath "images_links.csv" #saves the image source link
Write-Host "your links have been saved in a csv file named images_Links in your current working directory" #go to the current working directory and you can see your file saved with the name mentioned
}



