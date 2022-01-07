# dvote-js-bundle

Bundle version of dvote-js for environments that need to load global HTML scripts.

## Known limitations

This repository is only meant for cases where legacy HTML sites need to load remote JS code using HTML tags. The only tool that supports (as of writing) the current dvote-js dependencies is Browserify, which produces very large artifacts. This is a work in progress.

## Building

```sh
make init
make all
```

This will compile three artifacts on the `dist` folder.

## Get started

Copy the relevant artifact from `dist` to your HTML folder and load it like:

### Whole library

If using both census and voting, it's best to import the `main` artifact to save some bandwidth.

```html
<script src="./main.js"></script>
```

```js
const Vocdoni = window.getVocdoni();

const tokenR = Vocdoni.CensusCaApi.decodePoint(hexTokenR);
// ...
```

### Voting library

```html
<script src="./voting.js"></script>
```

```js
const { Voting } = window.getVoting();

const envelope = Voting.packageSignedEnvelope({
  censusOrigin: processParams.censusOrigin,
  votes: choices,
  censusProof,
  processId,
  processKeys,
});
// ...
```

### Census library

```html
<script src="./census.js"></script>
```

```js
const { CensusCaApi } = window.getCensus();

const tokenR = CensusCaApi.decodePoint(hexTokenR);
// ...
```
