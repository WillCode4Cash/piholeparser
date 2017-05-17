# piholeparser

## Less than basic usage

In the directory "parsed" are lists that I parse daily.

Add these lists directly to piholes webui or the adlists.list file.

It is probably best to copy the link in it's raw format.

### If you want all of the lists

Just add
 
https://raw.githubusercontent.com/deathbybandaid/piholeparser/master/parsed/1111ALLPARSEDLISTS1111.txt

## Basic Usage Instructions

sudo git clone https://github.com/deathbybandaid/piholeparser.git /etc/piholeparser/

cd /etc/piholeparser

sudo nano basic.lst 

##### all the lists you put here will be processed.

sudo bash /etc/piholeparser/basicparser.sh

## Advanced Usage Local

sudo git clone https://github.com/deathbybandaid/piholeparser.git /etc/piholeparser/

sudo cp /etc/piholeparser/piholeparserlocal.sh /etc/piholeparserlocal.sh

sudo bash /etc/piholeparser/piholeparserlocal.sh

#### Add a cronjob

20 0 * * * sudo bash /etc/piholeparserlocal.sh

## Advanced Usage Push to github

sudo git clone https://github.com/deathbybandaid/piholeparser.git /etc/piholeparser/

sudo cp /etc/piholeparser/piholeparsergithub.sh /etc/piholeparsergithub.sh

#### Adjust credentials in that file.

sudo bash /etc/piholeparser/piholeparsergithub.sh

#### Add a cronjob

20 0 * * * sudo bash /etc/piholeparsergithub.sh

### Adding Lists

Simply put the list you want parsed into a file in the lists folder like "NameOfListToParse.lst"

The script will pull the new lists, parse them, and then it will push the parsings up to the parsed directory.

### utilized the big list locally

http://localhost/lists/1111ALLPARSEDLISTS1111.txt
