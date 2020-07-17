# todo-list

Simple to-do list, done for demonstration purposes.

**Installation procedure**

1 - Check out from GitHub
```
$ git clone git@github.com:speric/todo-list.git
$ cd todo-list
```

2 - Update `config/database.yml` with the proper database information for your local db

3 - Install gems

`$ bundle install`

4 - Migrate database
```
$ rake db:create:all
$ rake db:migrate
```

5 - Start local server

`$ rails server`

6 - Navigate to [http://localhost:3000](http://localhost:3000)
