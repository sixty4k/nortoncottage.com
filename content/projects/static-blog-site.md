---
title: "Static Blog Site"
date: 2018-11-17T11:08:02-06:00
draft: false
---

# Blahhhgh

Some of my favorite internet days were the livejournal and everyone has a(n active) personal blog site somewhere.  I'd like to get there again.

## How

Hugo is a static site generator written in GoLang.  It's documented _sortof_ well, and while the folks who respond in the forum seem grumpy and not entirely able to grok the questions, there's a fair amount of knowledge there.  And a ton of 'how I made my blog' blog posts.

I'm not likely to write much about the basics of setting up a hugo managed blog, beyond saying: you don't need a theme, and the quickstart doc steers you so the wrong way.

## Blagging tools

Here's what I do want to document, for my own reference as well as to share, the scripts and _processes_ around hugo that I'm using to keep friction low.

### Where posts start

I'm likely to start writing in a handful place:

 - NValt, using NotePlan's icloud notes drive as it's backend
 - NotePlan, on my phone and laptop
 - Byword, on my phone and laptop
 - Sublime Text
 - Drafts, on my phone

I know that's a crazy amount of places, but they're all places that I write notes to self (nvalt,noteplan), save code snippets (nvalt), write longform thoughts (byword, subl), and drafts is where (I'm trying) to start all text on my phone.

### From Here to There: a dotted line wandering all over the neighborhood

In all of these cases, I end up with a markdown formatted file on a disk.  So we have a solid common starting point.

What I don't have is:

- hugo friendly front matter
- git process for updating the repo
- a publishing script (ideally automagical)


## Todo

- How do NotePlan, NValt, Byword cope with frontmatter?
- git hook to publish on master update


## Useful References

[Deployment with Rsync](https://gohugo.io/hosting-and-deployment/deployment-with-rsync/)
