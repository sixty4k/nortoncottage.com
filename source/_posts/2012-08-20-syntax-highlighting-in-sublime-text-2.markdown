---
layout: post
title: "Syntax Highlighting in Sublime Text 2"
date: 2012-08-20 11:54
comments: false
categories:
---

#Syntax highlighting in Sublime Text

It seems like this should be a pretty easy thing, but the existing documentation is not super clear (to me anyway), and it's definately not inviting.  But it seems like if I'm gonna use a fancy editor such as ST2, I should:

 - get syntax highlighting for the files I edit
 - understand how to add syntax highlighting for new file types
 - start learning the ins and outs of it.

##An adventure in regex and obtuse documentation

###Zone Files

I'm working my way through our zone files at $work, cleaning out the cruft of several generations of moving standards and moving the remains of old internal domains to the current domain.  So having some syntax highlighting seemed like a far more interesting thing that actually doing the work.  :D

####Things to highlight

Some docs from [Red Hat][1] and [IANA][2] were helpful in identifying my list of things to highlight: 
 - Comments
 - Directives
 - Resource Records
 - Time Units
 - MX Preference

###Figuring Out Syntax Highlighting

Starting with Sublime Text documentation ([old][4] and [new][5]) on syntax highlighting, and a [cheat sheet][6] for ST2's regex (ruby?).


####Starting Easy
  First I did comments, as that seemed like the easiest regex to not mess up.

{% codeblock Zone Comments lang:json %}
 "patterns": [
    { "match": ";.*",
      "name": "comment.line.semicolon.zone_file"
    },
{% endcodeblock %}

Made sense, semicolon and everything to the end of the line is a comment.  I had a little bit of trouble at first because I misread the [ST doc][4] writeup about naming, and named it something random.  This would catch me a few times through this until I made myself a [cheatsheet][7] that I could keep open in another window.

####Getting More Complex

The '@' directive was another pretty straightforward match, and as the rest of the directives in a zone file are a pretty short list, I just shoved it **all** into the regex.  Seemed to be an acceptable method of doing things (check out the html tmlanguage file for some crazy examples).  

{% codeblock Zone Directives lang:json %}
 { "match": "@",
      "name": "keyword.directive.zone_file"
    },
    { "match": "\\$(ORIGIN|origin|TTL|ttl|INCLUDE|include)\\s*(.*)",
      "name": "keyword.directive.zone_file",
        "captures": {
          "2": { "name": "variable.other.directive.zone_file" }
         }
    },
{% endcodeblock %}

So any directive is going to also have a variable.  The way this gets dealt with for syntax highlighting is "captures", in your regex you grab pieces of the match, the first will get named in the match, and all subsequent get named in the "captures" section.  (Man, I can't believe how not clear that sounds written out)

Captures get even more fun in this next bit

{% codeblock Zone Resource Records lang:json %}
    { "match": "([A-Za-z0-9-]*)\\s+([0-9A-Za-z]*)\\s+([I|i][N|n]\\s+[A-Za-z]+)\\s+(.*)",
        "name": "string.quoted.single.address.zone_file",
        "captures": {
            "2": { "name": "variable.other.timeunit.zone_file"},
            "3": { "name": "keyword.resourcetype.zone_file" },
            "4": { "name": "string.quoted.single.resource.address.zone_file" }
        }
    }
{% endcodeblock %}

So the initial match, as well as the last are the hostname/ip in a typical A record, "2" is the ttl for a single record (doesn't get used most of the time in my zone files, but I wanted to make sure it got colored the same as I did other time unit call outs).  "3" is the 'IN A', 'IN CNAME', etc.  I started going down a rabbit hole of actually correctly calling out of the resource types, but then realized that was far more work than necessary.

##Sharing

It's on [github] [3], pull requests gladly accepted.  Is this worth trying to get listed in Package Control?  Seems unlikely.  

###Next Steps

The easy plan is to work on other config files I look at regularly.  The harder plan is to expand past syntax highlighting and get into tab completions and shft-cmd-p creation of zone file templates and such.


<!-- links to bind zone file stuff -->
[1]: https://access.redhat.com/knowledge/docs/en-US/Red_Hat_Enterprise_Linux/6/html/Deployment_Guide/s2-bind-zone.html
[2]: http://www.iana.org/assignments/dns-parameters
[3]: https://github.com/sixty4k/st2-zonefile    "github repo for the zonefile crap"
<!-- links to st2 stuff -->
[4]: http://sublimetext.info/docs/en/extensibility/syntaxdefs.html   "depreiciated but more indepth"
[5]: http://docs.sublimetext.info/en/latest/reference/syntaxdefs.html   "current but less explaining"
[6]: http://www.geocities.jp/kosako3/oniguruma/doc/RE.txt   "regex for st2"
[7]: https://github.com/sixty4k/st2-zonefile/blob/master/list%20of%20highlightables.txt "Mike's Syntax Highlighting Naming cheat sheet"
