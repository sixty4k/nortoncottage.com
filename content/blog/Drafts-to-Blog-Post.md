---
title: "Drafts to Blog Post"
date: 2021-01-13
draft: false
---
Drafts to Blog Post


## How I thought this would work

 - Add Hugo header to draft
 - Send to git repo (via Working Copy on iOS, file export on Mac)
 - git commit
 - git push
 - Archive draft
 - Profit!

## What went wrong?

 - Adding front matter changed the draft 'title' to the `---` at the top of the front matter.
 - Working Copy script found on Drafts actions directory didn't work and was just cryptic enough for me to not understand
 - `safe_title` leaves spaces, so isn't ideal for a file name (I know they're supported, but spaces in file names leads to suffering, and we all know where that goes)

What ended up working?

## Step 1: A script step to generate a safer title

```
// https://forums.getdrafts.com/t/tag-or-shortcut-for-title-with-no-spaces-or-hyphen-separated/2349

let safeTitle = draft.processTemplate("[[safe_title]]");
let hyphenTitle = safeTitle.replace(" ", "-");
draft.setTemplateTag("hyphen_title", hyphenTitle);
```
This gives me the variable `hyphen_title` to use in further script steps.

Open Q: If I make this a separate Action, can I call it at the start of all my actions to get that Var all the time?

## Step 2: Clipboard

Replace existing clipboard with this:
```
---
title: "[[title]]"
date: 2021-01-13
draft: false
---
[[draft]]
```
That's the Draft, with the appropriate Hugo blog post front matter.

## Step 3:  x-callback-url Write File in Working Copy

```
working-copy://x-callback-url/write?key=9XEZRBTBM6&repo=nortoncottage.com&path=content/blog/Drafts-to Blog Post.md&clipboard=1
```

After a couple days of trying to wedge the file's body into the callback, I reread the docs and realized I could & should use the clipboard for the file's contents.  It was realizing that Drafts could _write_ to the clipboard that made me realize Working Copy could likely _read_ from it.

## Step 4: x-callback-url Commit (and push) File in Working Copy

```
working-copy://x-callback-url/commit?key=9XEZRBTBM6&repo=nortoncottage.com&limit=1&path=content/blog/Drafts-to Blog Post.md
```

This _works_ but currently flips me to Working Copy to fill out the commit log.  Longer term goal is to have the drafts action ask me for this at the beginning of the action.

## Next Steps

Add an `Archive Draft` step once I'm happy/confident with the process.

This gives me a blogging workflow on my iPad (and in theory my phone), but won't work on a Mac.  So, next up is adding steps to this Drafts Action that do the same on a Mac.  Something along the lines of: export to file in correct place, script to run git commands (or whatever round about thing I'll need to do to get around sandboxing)

On the git (GitHub) side of things, I need to trigger a Hugo build and publish.


