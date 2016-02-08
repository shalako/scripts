#! /bin/bash

if [ "$1" == stable ]
then

  echo 'Downloading latest stable'
  curl -sL "https://cli.run.pivotal.io/stable?release=macosx64-binary&source=github" | tar -zx

else

  echo 'Downloading latest edge'
  curl -sL "https://cli.run.pivotal.io/edge?arch=macosx64&source=github" | tar -zx

fi

echo 'Moving binary to /usr/local/bin/cf'
mv cf /usr/local/bin/cf
