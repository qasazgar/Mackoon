# Mockoon Docker Project

## نحوه استفاده

1. ساخت ایمیج Docker:
```
docker build --build-arg REPO_URL=https://github.com/username/mockoon-project.git -t mockoon-git .
```
2. اجرای کانتینر:
```
docker run -d -p 3000:3000 --name mockoon-container mockoon-git
```
3. دسترسی به API:
```
http://YOUR_SERVER_IP:3000/hello
```
4. آپدیت کانتینر بعد از تغییر ریپازیتوری:
```
docker build --build-arg REPO_URL=https://github.com/username/mockoon-project.git -t mockoon-git .
docker stop mockoon-container
docker rm mockoon-container
docker run -d -p 3000:3000 --name mockoon-container mockoon-git
```