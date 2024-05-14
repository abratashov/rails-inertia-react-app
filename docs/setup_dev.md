# Setup development env

## Setup tools

### Install RVM and Ruby
```sh
# https://rvm.io/rvm/install

rvm install $(sed -n '1p' .ruby-version)
rvm use $(sed -n '1p' .ruby-version)

bundle install
```

### Install Node
```sh
nvm install $(sed -n '1p' .nvmrc)
nvm use $(sed -n '1p' .nvmrc)
node -v
npm install -g yarn
cd .. && cd rails-inertia-react-app
yarn
```

## Run app
```sh
bin/dev
```

To create an SSR build:

```sh
bin/vite build --ssr
```

To start the SSR node.js server:

```sh
bin/vite ssr
```

Go to http://localhost:3000
