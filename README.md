# Exercism

My personal solutions to code challenges on [exercism.org](https://exercism.org/profiles/kplattret).

## TypeScript

In the `./typescript` folder, download a challenge, for instance:

```sh
$ cd typescript
$ exercism download --exercise=hello-world --track=typescript
```

In the root folder of a challenge, install the dependencies:

```sh
$ cd hello-world
$ yarn install

# Install @babel/core if there is a warning
$ yarn add --dev @babel/core

# Install with npm to solve @types/jest errors
$ npm install

# Make sure yarn enables node-modules linker
$ yarn install
```

Then run the tests to drive the development:

```sh
$ yarn test
```

If working on a fresh copy of this repository, overwrite the challenge first:

```sh
$ exercism download --exercise=hello-world --track=typescript --force
```
