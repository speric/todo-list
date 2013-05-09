#todo-list

Simple to-do list, done for demonstration purposes.

**Installation procedure**

1 - Check out from GitHub
```
$ git clone git@github.com:speric/todo-list.git
$ cd todo-list
```

2 - Update `config/database.yml` with the proper database information for your local db

3 - Migrate database
```
$ rake db:create:all
$ rake db:migrate
```

4 - Install gems

`$ bundle install`

5 - Start local server

`$ rails server`

6 - Navigate to [http://localhost:3000](http://localhost:3000)
