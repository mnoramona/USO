mkdir /home/student/tema3-scripts-output/backup-confs
touch /home/student/tema3-scripts-output/backup-confs/errors.txt

for file in $(find /etc -iname '*.conf')
do
cp -r $file /home/student/tema3-scripts-output/backup-confs 2> /home/student/tema3-scripts-output/backup-confs/errors.txt
done

for file in $(find /home/student/tema3-scripts-output/backup-confs -size +1k)
do
mv "$file" "$file"_large 2> /home/student/tema3-scripts-output/backup-confs/errors.txt
done
