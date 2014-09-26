dockerfile-npm-lazy
===============

npm_lazy caching npm registry layer in docker container

build
===============
build the image normally
```
git clone https://github.com/bcicen/docker-npm-lazy.git
cd dockerfile-npm-lazy/
docker build -t npm-lazy:latest .
```    

running
===============
No exta parameters are needed to run the npm_lazy container locally:
```
docker run -d npm_lazy
```
However, if you plan on accessing npm_lazy externally, you'll need to set that name:
```
docker run -e EXTERNAL_NAME=npm.mydomain.com -d npm_lazy
```
