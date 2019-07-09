# Goal
I use this app to study some concepts, libraries, etc. It consists in a planner where the user can calculate the estimated cost of a trip.

### Trello board
https://trello.com/b/SqzuJiMe/simple-trip-planner

### Dev environment

You only need docker:

```bash
$ docker-compose build
$ docker-compose run
# In another terminal window
$ docker-compose run web rails db:create
$ docker-compose run web rails db:migrate
```
