## hello-gunicorn-flask

A small demo Flask app with a Dockerfile and `fly.toml` for deployment on Fly.io.

```
$ git clone https://github.com/fly-apps/hello-gunicorn-flask.git
```

```
$ cd hello-gunicorn-flask 
```

To deploy on Fly.io:

We recommend using our Apps V2 platform for any new apps. You can check if your org defaults to Apps V2 deployments with `fly orgs apps-v2 show <org-slug>`. Get your organization slug using `fly orgs list`. To set your default to Apps V2, run `fly orgs apps-v2 default-on <org-slug>`.

```
$ fly launch
An existing fly.toml file was found for app hello-gunicorn-flask
? Would you like to copy its configuration to the new app? Yes
Creating app in /Users/chris/FlyTests/apr9/hello-gunicorn-flask
Scanning source code
Detected a Dockerfile app
...
? Would you like to set up a Postgresql database now? No
? Would you like to set up an Upstash Redis database now? No
Wrote config file fly.toml
? Would you like to deploy now? Yes
==> Building image
Remote builder fly-builder-young-smoke-4165 ready
==> Creating build context
--> Creating build context done
==> Building image with Docker
--> docker host: 20.10.12 linux x86_64
Sending build context to Docker daemon  1.067kB
...
--> Pushing image done
image: registry.fly.io/testrun:deployment-01GXKAW83V1V5JRNFB9DC6FJ2G
image size: 141 MB
Provisioning ips for testrun
  Dedicated ipv6: 2a09:8280:1::2d:956
  Shared ipv4: 66.241.125.128
  Add a dedicated ipv4 with: fly ips allocate-v4
Process groups have changed. This will:
 * create 1 "app" machine

No machines in group 'app', launching one new machine
  Machine 9080e694c05d87 [app] update finished: success
```

Check it's working:
```
$ fly open
opening http://testrun.fly.dev ...
```

(then [scale up](https://fly.io/docs/apps/scale-count/) for high availability)
