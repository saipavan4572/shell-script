
**For Normal User**
```
id
```
3.83.102.0 | 172.31.87.141 | t2.micro | https://github.com/saipavan4572/shell-script.git
[ ec2-user@ip-172-31-87-141 ~/shell-script ]$ id
uid=1001(ec2-user) gid=1001(ec2-user) groups=1001(ec2-user)

```
sudo su
```
3.83.102.0 | 172.31.87.141 | t2.micro | https://github.com/saipavan4572/shell-script.git
[ ec2-user@ip-172-31-87-141 ~/shell-script ]$ sudo su

**For Sudo User**

3.83.102.0 | 172.31.87.141 | t2.micro | https://github.com/saipavan4572/shell-script.git
[ root@ip-172-31-87-141 /home/ec2-user/shell-script ]# id
uid=0(root) gid=0(root) groups=0(root)

* Always sudo user id is 0.

* To get exact uid of a user
```
id -u
```
[ ec2-user@ip-172-31-87-141 ~/shell-script ]$ id -u
1001
