# README
This is a standard rails api application, it consumes a public api that
serves famous programming quotes, there is no need of a database of any
kind.
This API is a restful json api, it has 2 endpoints
```
http://localhost:3000/v1/hello which returns a message 'Hello World'
```
```
http://localhost:3000/v1/quotes which returns a random quote from a public API https://programming-quotes-api.herokuapp.com/quotes/random
```
### Project set up
* Manual set up could be done but I've included docker and docker
  compose files to speed up the process
- Download docker https://docs.docker.com/get-docker/, then run
```
docker-compose up --build
```
* For a manual installation without Docker, install ruby 2.7 via (RVM)[https://rvm.io/]
* Install [nodejs](https://nodejs.org/en/download/)
* Install  [yarn](https://classic.yarnpkg.com/en/docs/install)
* Install bundler
 ```
gem install bundler
```
* Then install all the dependencies
 ```
 bundle exec bundle install
 ```
* Run the server
 ```
 rails server
 ```
 Default address is localhost:3000

* How to run the test suite
 ```
 bundle exec rails test
 ```
