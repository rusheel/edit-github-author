#!/bin/sh

for var in "$@"
do
   if [ $var = $1 ]; then
	continue
   fi
   git clone --bare https://github.com/$1/$var.git
   cd $var.git
   ./../edit-info.sh
   git push --force --tags origin 'refs/heads/*'
   cd ..
   rm -rf $var.git
done

