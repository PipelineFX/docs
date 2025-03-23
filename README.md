<p align="left">
  <img src="static/img/QubeLogo.png">
</p>


# Introduction

This is PipeineFX's repository for Qube! user documentation.

Our updated documentation is built using [Docusaurus 3.7.0](https://docusaurus.io/) - an advanced static-site generator.

Please feel free to use internally or submit pull requests if you find any issues.

## Steps to install and run the PipelineFX documentation website locally on Windows

### Install Node

* **Download and install fnm**
```
winget install Schniz.fnm
```

*open new terminal*

* **Download and install Node.js**
```
fnm install 20
```

* **Add the node install to the PATH**
e.g. "C:\Users\\\<User\>\AppData\Roaming\fnm\node-versions\v20.19.0\installation"

*open new terminal*

* **Verify the Node.js version**
Should print "v20.19.0" or later.
```
node -v
```

* **Verify npm version**
Should print "10.8.2" or later.
```
npm -v
```

* **Install docusaurus-search-local**
```
npm install @cmfcmf/docusaurus-search-local	
```



## Install Git

* **Download and install Git**
```
winget install -e --id Git.Git
```

*open new terminal*

* **Switch to your Git folder**
```
cd C:\Git
```

* **Clone the docs repository**
```
git clone https://github.com/PipelineFX/docs.git
```



## Install Docusaurus

The .gitignore file omits the node_modules and build folders from the github repository as a space savings measure, so we install the Node packages detailed in package.json, including docusaurus.
```
cd docs
npm install
```



## Launch the website
* **Runs on http://localhost:3000**
```
npm run start
```
-or-
```
npm run build
npm run serve
```

start - fires the development server, with an in-memory bundle that refreshes
quickly so it's fast to iterate and check your changes.

build - creates files that are ready to be hosted somewhere.
It's slower and does not update on change unless you run the build script
again. It's what is called the "production version" of your app.



## Allow outside connections
* **Runs on http://\<IP Address\>:3000**
```
npm run start -- --host 0.0.0.0
```
-or-
```
npm run serve -- --host 0.0.0.0
```



Mahalo,

[PipelineFX Support](mailto:support@pipelinefx.com?subject=[GitHub]PipelineFX%20Documentation)
