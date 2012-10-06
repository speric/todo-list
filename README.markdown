#creative-commissary

*We are cloning Radford Harrell at [Creative Commissary](http://www.creativecommissary.com)*

**Installation procedure**

1 - Check out creative-commissary from GitHub

`$ cd /to/your/dev/folder`

`$ git clone git@github.com:talentsoup/creative-commissary.git`

`$ cd creative-commissary`

2 - Use bundler to install gems

`$ gem install bundler`

`$ bundle install`

3 - Install and set up [Pow](http://pow.cx/)

`$ curl get.pow.cx | sh`

`$ cd ~/.pow`

`$ ln -s /to/your/dev/folder/creative-commissary creativecommissary`

4 - Get YML config files from [Eric](mailto:eric@talentsoup.com?subject=YML files for local CC development)

The app can now be reached at [http://creativecommissary.dev/](http://creativecommissary.dev/)

You can login to the admin back-end at [http://creativecommissary.dev/saas_admin](http://creativecommissary.dev/saas_admin) with the email `admin@example.com` and password `password`.

You can login to the test account at [http://test.creativecommissary.dev](http://test.creativecommissary.dev) with the email `test@example.com` and password `tester`.
