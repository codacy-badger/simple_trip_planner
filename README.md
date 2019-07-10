[![CircleCI](https://circleci.com/gh/bcrivelaro/simple_trip_planner/tree/master.svg?style=svg)](https://circleci.com/gh/bcrivelaro/simple_trip_planner/tree/master)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/a4d9464a737941cab9ecc721bc495a81)](https://www.codacy.com/app/brunosantoscrivelaro/simple_trip_planner?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=bcrivelaro/simple_trip_planner&amp;utm_campaign=Badge_Grade)

# Goal
I use this app to study some concepts, libraries, etc. It consists in a planner where the user can calculate the estimated cost of a trip.

### Services/Apps

- Slack
- [Trello](https://trello.com/b/SqzuJiMe/simple-trip-planner)
- [CircleCI](https://circleci.com/gh/bcrivelaro/simple_trip_planner/tree/master)
- [Codacy](https://app.codacy.com/project/brunosantoscrivelaro/simple_trip_planner/dashboard)
- Depfu (GitHub App)

### Dev environment

Get your `.env` file:

```
cp .env.example .env
```

After that, you only need Docker:

```bash
$ docker-compose build
$ docker-compose run
# In another terminal window
$ docker-compose run web rails db:create
$ docker-compose run web rails db:migrate
```
