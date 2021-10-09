#/bin/sh

cd ./deploys
for target in $(find ./ -maxdepth 1 -o -type d); do 
    if [ "$target" = "./" ]; then
        continue
    else
        echo $target
        ./$target/install.sh
    fi
done
