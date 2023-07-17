# Exercism

My personal solutions to code challenges on [exercism.org](https://exercism.org/profiles/kplattret).

## First steps

Install and configure the [Exercism CLI](https://exercism.org/docs/using/solving-exercises/working-locally).

## Elixir

In the `./elixir` folder, download a challenge, for instance:

```sh
$ cd elixir
$ exercism download --exercise=hello-world --track=elixir
```

In the root folder of a challenge, run the tests to drive the development:

```sh
$ cd hello-world
$ mix test
```

Submit the working solution to Exercism:

```sh
$ exercism submit
```

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

Submit the working solution to Exercism:

```sh
$ exercism submit
```

_Note: if running/testing an existing challenge on a fresh copy of this repository, you will need to
overwrite it first using the `--force` flag in the corresponding `exercism download` command._
