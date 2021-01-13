---
title: "Drafts to Blog Post"
date: 2021-01-12
draft: false
---
Drafts to Blog Post

Step 1: add front matter to the drafts post

Looks like:

```
---
title: "[[title]]"
date: 2021-01-12
draft: false
---
[[draft]]
```

Step 2: Send to git repo (Working Copy)

Failed plan: export to Files
 - Annoyingly this doesn't seem like it's something I can automate to do with no interaction.

 working-copy://x-callback-url/write/?repo=nortoncottage.com&path=content/blog/[[websafe_title]].md&text=---%0alayout%3A%20post%0atitle%3A%20[[title]]%0a---%0a
Step 1: add front matter to the drafts post

Looks like:

```
---
title: "[[title]]"
date: 2021-01-12
draft: false
---
[[draft]]
```

Step 2: Send to git repo (Working Copy)

Failed plan: export to Files
 - Annoyingly this doesn't seem like it's something I can automate to do with no interaction.

 working-copy://x-callback-url/write/?repo=nortoncottage.com&path=content/blog/[[websafe_title]].md&text=---%0alayout%3A%20post%0atitle%3A%20[[title]]%0a---%0a[[body]]&key=12345678

Path: Working Copy/nortoncottage.com/content/blog/<title>.md

Step 3: In Working Copy, commit change and push

Step 4: On GH or ?? Build the blog, and publish


OMG It's nothing like the steps I thought.

&key=12345678

Path: Working Copy/nortoncottage.com/content/blog/<title>.md

Step 3: In Working Copy, commit change and push

Step 4: On GH or ?? Build the blog, and publish


OMG It's nothing like the steps I thought.


