# oracle

Ask a question about your repositories using Semgerep rules.

Place the questions in the format of a semgrep rule in the `questions` folder.

The github action will scan all repositories listed and return the result.


#### repos.txt

Contains the repositories we ant to scan.
One repository for each line.

e.g.

```
hoeg/semhook
hoeg/terraperm
hoeg/someotherrepo
```

#### repos.ignored

Contains repositories we do not want to scan eventhough they are part of the `repos.txt` file.
We include this as a circuite breaker for when we e.g. pull the `repos.txt` file from github search.

Format is the same as `repos.txt`

### TODO

- [ ] Check returned format
- [ ] Send result to webhook
- [ ] figure out if we can cache something (repos) between runs
