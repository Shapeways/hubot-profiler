# hubot profiler
Hubot script to profile statistics of a website.
So far, supports lookup of website response time, 
but more is planned!

##Commands

To get the server response time, type:

`> hubot response time of https://google.com`

It also supports a shorthand `google.com` which will be interpreted as `http://google.com`.


##Installation
Add `hubot-profiler` as a dependecy in your `packages.json` file
```
"dependencies": {
    "hubot-profiler": "git://github.com/shapeways/hubot-profiler.git"
}
```
Run `npm install` to ensure all dependencies are installed

To enable the script, you need to add `hubot-profiler` to the `external-scripts.json` file

