#!/bin/bash
## This takes the work done in parser.sh
## and merges it all into one

## Version
source /etc/piholeparser.var

## Colors
source /etc/piholeparser/scripts/colors.var

####################
## Big List       ##
#################### 

echo ""
printf "$blue"    "___________________________________________________________"

echo ""
printf "$green"   "Attempting Creation of Big List."
echo ""

TEMPLIST=/etc/piholeparser/parsedall/ALLPARSEDLISTS.txt
BIGLIST=/etc/piholeparser/parsedall/1111ALLPARSEDLISTS1111.txt

if 
ls $BIGLIST &> /dev/null; 
then
sudo rm $BIGLIST
else
:
fi

## Combine Small lists
sudo cat /etc/piholeparser/parsed/*.txt > $TEMPLIST
echo -e "\t`wc -l $TEMPLIST | cut -d " " -f 1` lines after merging individual lists"

## Duplicate Removal
echo ""
printf "$yellow"  "Removing duplicates..."
sort -u $TEMPLIST > $BIGLIST
echo -e "\t`wc -l $BIGLIST | cut -d " " -f 1` lines after deduping"
sudo rm $TEMPLIST

#test $(stat -c%s $BIGLIST) -eq 0
#test $(stat -c%s $BIGLIST) -ge 104857600
## Github has a 100mb limit and empty files are useless
BFILESIZE=$(stat -c%s "$MFILENAME")
if
test $BFILESIZE -ge 104857600
then
echo ""
printf "$red"     "Parsed File Too Large For Github. Deleting."
sudo rm $BIGLIST
sudo echo "File exceeded Githubs 100mb limitation" | sudo tee --append $BIGLIST
#printf "$red"     "Parsed File Too Large For Github. Splitting."
#split -b 100m $BIGLIST
elif
test $BFILESIZE -eq 0
then
echo ""
printf "$red"     "File Empty"
sudo echo "File Size equaled zero." | sudo tee --append $BIGLIST
else
echo ""
printf "$yellow"  "Big List Created Successfully."
fi

## duplicate Big List file
sudo cp $BIGLIST /etc/piholeparser/parsed/

printf "$magenta" "___________________________________________________________"
echo ""

####################
## Big Source     ##
####################

printf "$blue"    "___________________________________________________________"
echo ""
printf "$green"   "Rebuilding the Sources file."
echo ""

BIGSOURCE=/etc/piholeparser/parsedall/1111ALLPARSEDLISTS1111.lst

if 
ls $BIGSOURCE &> /dev/null; 
then
sudo rm $BIGSOURCE
else
:
fi

sudo cat /etc/piholeparser/lists/*/*.lst | sort > $BIGSOURCE
echo -e "\t`wc -l $BIGSOURCE | cut -d " " -f 1` lists processed by the script."

printf "$magenta" "___________________________________________________________"
echo ""
