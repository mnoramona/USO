cat /etc/passwd | grep "/usr/sbin/nologin" | cut -f1,5 -d ":" | sort -n | head -10 > /home/student
