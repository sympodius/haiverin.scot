---
title: 'Why I Use Emacs For Writing'
date: 2017-10-09T16:30:00+01:00
author: John Urquhart Ferguson
description: A writer talks about why modern software doesn't satisfy his specific needs when writing fiction, and how he ended up turning to an old code editing program to solve his problems.
summary: A long journey to come back to the past.
readingEase: 8th/9th Graders
gradeLevel: 10
images:
- images/post-cover.png
categories:
- emacs
tags:
- writing
- coding
- Elisp
- Emacs
- Org Mode
- Markdown
- LaTeX
- publishing
- Microsoft Word
- OpenOffice.org
- LibreOffice
- OmmWriter
- Scrivener
- Vim
draft: false
---

{{< banner src="images/post-cover.png" alt="Emacs Logo. Credit: Nicolas Petton - Copyright © 2015-2017 Free Software Foundation, Inc. License: GNU General Public License version 3 or later" >}}

{{< md-comment >}}
# Instructions

- [ ] Encourage engagement and interaction
- [x] Keep all blog entries as leaf bundles (for example, `hugo new content tech/blog-entry-name` with no .md creates a leaf bundle in the tech section)
- [x] Create a banner image (post-cover.png) in your leaf bundle that is dimensions: 962x520 (1.85:1)
- [x] Still manually add banner image into page content, first thing before anything else using the banner shortcode
- [x] Add any other images you use to the images front matter array (this is purely to help with OpenGraph generation)
- [x] You can use up to two more images in the blog entry, but try not to use any more (unless this is a listicle). Only the banner is essential
- [ ] Try to write 1000 words. The closer to this number, the better, but don't go over (75% of the public prefers reading articles under 1,000 words)
- [ ] Reading time should not exceed seven minutes
- [x] Make sure to include a description and summary for the blog entry as these are used on the site and in SEO
- [x] Make an appropriate choice of tags in the front matter. These will help in recommending pages to the reader
- [x] Make an appropriate choice of categories in the front matter. The first category will be used in the breadcrumb for the page, others will generate the side menu
- [x] Use Emacs to generate the reading ease and grade level (this should happen automatically when saving the file in my Emacs configuration). These are just for fun, incidentally, and appear to have no impact on audience engagement
- [x] Set the draft to false when you want to publish, then push to GitHub
- [ ] Drop a video announcing this post on Instagram etc, and post anywhere else you can as well. Reels and videos work better for engagement
- [ ] Consider what tomorrow's article will be, and try to post a new one once a day (more is fine)
{{</ md-comment >}}

Are you ready to learn about the overly complex system I use for writing fiction? According to an overwhelming number of requests (there were three), yes!

The main software I use is called [Emacs](https://www.gnu.org/software/emacs/). Telling people this usually results in one of two questions: "What's Emacs?" or "Why don't you just use [Word](https://en.wikipedia.org/wiki/Microsoft_Word)?"

I shall answer both these questions, but keep in mind that these are my personal opinions, and that I'm not an Emacs expert.

Let's start with the second question first, "Why don't you just use Word?"

Word is a perfectly fine program. I have friends that have written entire books and PhD theses in Word. I am, in no way, denigrating Microsoft Word. Now that we've cleared that up, let's talk about why I don't want to use it.

I *have* used word processors in the past to do writing. Microsoft Word was one of them. I also used [OpenOffice](https://en.wikipedia.org/wiki/OpenOffice.org) and [LibreOffice](https://en.wikipedia.org/wiki/LibreOffice), but I found that none of them satisfied my writing needs. My main issue was with planning. I don't feel that Word Processors are set up for planning out stories. My solution had been to create an 'index document' that listed the names of other documents in the project. These documents included location descriptions, character sheets, story notes, and the story file itself. This way of doing things worked well for me, but I found that doing it in a word processor was usually cumbersome.

Another problem I had with word processors is that I could never get documents to look truly professional when I published them.

This led to my next experiment. Instead of doing everything in a word processor (both writing and formatting), I tried to use different programs for different parts of the writing process. I continued to use LibreOffice for planning, but I tried to do my actual writing in a 'distraction-free text editor.' These are minimalist text editors that generally take up your whole screen and try to keep you focused on writing. I was never totally sold on this concept, but I gave it a go using a program called [OmmWriter](https://ommwriter.com/). Once I had written my text, I would then manually format it in a typesetting program, called [LaTeX](https://www.latex-project.org/).

Distraction-free writing did not improve my speed or enjoyment (though some people swear by it). The typesetting was fantastic though. LaTeX is an incredibly powerful tool, and I have a deep love for it. Amazingly, it is free software. However, it is also essentially a programming language and has a steep learning curve. I consider myself technically minded and it still took me the better part of a year to feel totally comfortable with it.

So, for a while, I started writing directly in LaTeX. I even wrote my PhD thesis this way. This isn't a great idea. Writing directly in LaTeX splits up the text with a lot of programming code. This makes it unpleasant to edit, and time-consuming to cleanly convert to other formats. For example, if I want to publish a story on a website, I need to manually convert all the LaTeX text into something the website can accept. Automated programs exist for LaTeX that attempt to do this, but I did not have great success with them. LaTeX also isn't great for planning anything. I was getting increasingly fed up with having to open word processors and LaTeX at the same time. I just wanted one program that could do everything.

The first program I tried to use for this was [Scrivener](https://www.literatureandlatte.com/scrivener.php). It's a fantastic program. I'd say most writers should just buy Scrivener and end things there. It had the best story planning features of any program I'd used, it could output to various formats, and it was pleasant to write in (even including a distraction-free mode). I used Scrivener happily for years, and even wrote the first drafts of a couple of novels in it. My only real issue was that I still preferred the typeset output of LaTeX, and would manually convert my books to that format when I was done with a draft (I believe modern versions of Scrivener now allow you to export to LaTeX directly). The same was also true of publishing to the web, but I was willing to forgive all that because Scrivener was so enjoyable to plan and write with.

So why did I change?

Eventually there were two issues that made me leave Scrivener, and I've not heard of any other writers experiencing them. The first is that Scrivener's file format caused me some issues. I found it difficult to use under version control, and a couple of times the files became corrupted. Scrivener was unable to recover the files, requiring me to go through them all myself in a hex editor and manually extracting all the text. I then had to copy them into a new Scrivener project, and rebuild everything. The second time this happened, I felt it was too catastrophic for me to continue using Scrivener.

The second issue I had is that Scrivener only runs on MacOS and Windows. I was becoming increasingly inclined to do my writing on the move, and as I attempted to use smaller and smaller computers for writing, I was finding that they generally didn't run Windows or MacOS. I boldly attempted to write in whichever text editor these computers had available (manually adding the text back into Scrivener when I returned home), but it was a painful operation. Also, lacking access to my planning documents while mobile proved to be inefficient.

So, after this long journey, I had discovered what I needed from my writing software:

- It must work on most operating systems
- It must output to any format I choose with minimal intervention (write once, publish anywhere)
- It should include good features for planning
- It should be enjoyable to write in
- It should be contained within one interface

Scrivener was certainly the tool that came the closest to achieving these rather demanding goals, but it was still short on the first two. Additionally, I was still a little wary of Scrivener after two of my novels became corrupted while using it. Certainly, though, we have fully answered why I didn't use Word.

Now onto the second question: What's Emacs?

Emacs is a tool I was already loosely familiar with, but not for writing. During my undergraduate degree in Computing Science, I had to use Emacs and [Vim](https://www.vim.org/) to program some assignments. Both were text editors aimed at programming, and each had a steep learning curve. However, they were both powerful, and they worked on nearly all computer operating systems. Learning to use them well was an investment in 'future/past proofing' our programming tool-set. I, like most of the computing students, learned them well enough to do the required assignments, then never used them again. It's not that these tools are bad (far from it), but they take a significant amount of time to learn well. If you get to that stage, your programming efficiency is likely to be much higher, but in the middle of a degree with coursework constantly looming over you, you don't feel you have the time.

When searching for a writing tool to satisfy my conditions, I remembered my time with Emacs and Vim. I read up on them more deeply and found that they dated back to the earliest days of computing. However, they were still in continuous development, and were now highly powerful and efficient tools (once you got to know them). Also, they seemed to work on most computers that had existed, or were ever likely to exist. Either of them would make a fine choice, but it was a particular feature of Emacs that intrigued me.

Emacs has a feature called Org mode that makes it behave like a Wiki. You can trivially create hyperlinks between documents, and structure text with headings and basic formatting. This is all done in pure text with a minimalist markup (Org mode slightly predates [Markdown](https://en.wikipedia.org/wiki/Markdown) in this regard), allowing Org mode to format the results for display. Emacs also has the ability to display multiple files on screen at once. Taken together, this meant that I could still use my 'index document' system from years ago, but now I could actually click on the names of files to have them immediately open in another pane in the same program. This may seem like a small victory, but the potential power underlying Org mode goes far beyond this. With a bit of setup for each project (which Scrivener would have done for me automatically, I suppose), I could mimic most of Scrivener's features, and be using a system that worked on most operating systems.

The last part of the puzzle was getting Emacs and Org mode to output to other formats. Well, it turns out that Org mode has a bunch of exporters built-in to do most of the heavy lifting for us. The only problem was that my index document setup made it difficult for Org Mode to know which files to include in the output, and how to merge them.

This is where things get pretty far out. Emacs has a programming language built right into it at a fundamental level. In fact, most of Emacs is actually smaller programs written in that language, all working together to make the larger program that is Emacs. Therefore, I could learn that programming language ([Elisp](https://en.wikipedia.org/wiki/Emacs_Lisp)), write a few programs of my own to deal with the output formatting, et voilà: all my needs resolved.

I have attempted to avoid getting too technical in this article about how my Emacs/Org Mode setup works. I'm hoping to turn my Elisp additions into a full blown package that others can use... but only time will tell. But, here at the end of our journey, we can see that Emacs is perhaps the only program that had the capabilities to fully resolve all my rather demanding and niche requirements for writing software. I thank the universe every day for the existence of Emacs, but the rest of you might want to stick with Scrivener.
