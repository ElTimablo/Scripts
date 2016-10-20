#!/bin/bash

pictures=`ls *.{jpg,jpeg,png,tiff,gif}`
videos=`ls *.{mp4,avi,mkv,m4v}`
isos=`ls *.iso`
music=`ls *.{mp3,aac,flac,wav}`
documents=`ls *.{doc,docx,xls,xlsx,ppt,pptx,pdf,txt,rtf}`
packages=`ls *.{rpm,deb}`
pictureDir=~/Pictures
videoDir=~/Videos
isoDir=~/Images
musicDir=~/Music
docsDir=~/Documents
packageDir=~/Packages
echo "Pictures found:"
echo $pictures
echo "Videos found:"
echo $videos
echo "Music found:"
echo $music
echo "ISO files found:"
echo $isos
echo "Package files found:"
echo $packages
for i in $pictures
do
  mv $i $pictureDir
done
for i in $videos
do
  mv $i $videoDir
done
for i in $music
do
  mv $i $musicDir
done
for i in $isos
do
  mv $i $isoDir
done
for i in $documents
do
  mv $i $docsDir
done
for i in $packages
do
  mv $i $packageDir
done
