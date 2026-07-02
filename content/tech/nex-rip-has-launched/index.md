---
title: 'Nex.RIP Has Launched!'
date: 2026-07-01T11:37:36+01:00
author: John Urquhart Ferguson
description: Nex.RIP is live — a music production community with tutorials, open source advocacy, and a novel system for rating software hindrance.
summary: A behind-the-scenes look at building Nex.RIP and the Hindrex system.
readingEase: 8th/9th Graders
gradeLevel: 9
images:
- images/post-cover.png
categories:
- web-design
tags:
- web-design
- coding
- backstage
- webdev
- opensource
- music
- hindrex
- hugo
- nexami-engeo
- nex
- nex-rip
draft: false
---

{{< banner src="images/post-cover.png" alt="A stone circle with a grave stone marked 'NEX RIP.' Credit: John Urquhart Ferguson" >}}

{{< md-comment >}}
# Instructions

- [ ] Encourage engagement and interaction
- [x] Keep all blog entries as leaf bundles (for example, `hugo new content tech/blog-entry-name` with no .md creates a leaf bundle in the tech section)
- [x] Create a banner image (post-cover.png) in your leaf bundle that has a ratio of 1.85:1, and is no smaller than: 962x520 pixels (Ideally 1536x830 or greater)
- [x] Still manually add banner image into page content, first thing before anything else using the banner shortcode
- [x] Add any other images you use to the images front matter array (this is purely to help with OpenGraph generation)
- [x] You can use up to two more images in the blog entry, but try not to use any more (unless this is a listicle). Only the banner is essential
- [x] Try to write 1000 words. The closer to this number, the better, but don't go over (75% of the public prefers reading articles under 1,000 words)
- [x] Reading time should not exceed seven minutes
- [x] Make sure to include a description and summary for the blog entry as these are used on the site and in SEO. Ideally the summary should be short and engaging to entice readers. The description is for webcrawlers and should be around 150 characters (no more than 160)
- [x] Make an appropriate choice of tags in the front matter. These will help in recommending pages to the reader
- [x] Make an appropriate choice of categories in the front matter. The first category will be used in the breadcrumb for the page, others will generate the side menu
- [x] Use Emacs to generate the reading ease and grade level (this should happen automatically when saving the file in my Emacs configuration). These are just for fun, incidentally, and appear to have no impact on audience engagement
- [x] Set the draft to false when you want to publish, then push to GitHub
- [ ] Drop a video announcing this post on Instagram etc, and post anywhere else you can as well. Reels and videos work better for engagement
- [ ] Consider what tomorrow's article will be, and try to post a new one once a day (more is fine)
{{</ md-comment >}}

It's been a little quiet over here on haiverin.scot recently because I've been spending a lot of time with my old pal, Nexami Engeo.

Yup. That one.

I actually helped him design the *engeo* website back in the day (that's the rock band that made him famous, in case you weren't aware). He's wanting to get back into making music again now that all the legal handcuffs with the record company have expired. However, it's a little more than that...

He called me up to see if I was still making websites, but I told him it had been a while since I did one for someone else. I showed him *haiverin.scot* and told him it was really just a place for me to put my thoughts, but he loved it! He said he wanted one just like that... but as if it was a comic book from the future. Sounded fun, so I signed up.

Nex is trying to create a blog, a tutorial website, and a review website all in one. His top priority is to encourage people to make music together and be part of a community that actually communicates. It all sounds wonderful. I really hope it does well.

From my end, I was initially just helping make a re-themed version of *haiverin.scot*, but then Nex kept asking me about other technical stuff. Since I was around anyway, I didn't mind chipping in. He was setting up computers and music equipment in this little room in his flat and was getting a little confused about the order of things. I don't really know too much about music, but I understood the physics of getting the sound through the things it needed to get through before it went into the computer. His little studio is working quite well now. All the cables are labelled and routed around in a sensible way.

After we got all that set up, Nex was asking me what I knew about computer music production. The answer, again, was not that much. But I knew a bit about storing audio digitally, and I knew a lot about open source software. We had a lot of discussions about the pros and cons of open source versus proprietary, and he seems really excited that open source could really mesh well with what he's trying to do with his new site.

Apparently Nex had a bit of a bad incident when he tried to get his old demos loaded up on the new computer. The most up-to-date version of the software he used back then no longer supports the old files. I feel bad for him, though it's a little surprising he didn't have them backed up in a more generic format somewhere. I guess that's the sort of stuff you maybe think about when you're more on the tech end of things. When I explained to him that open source stuff generally can't be locked down that way (even in a worst case scenario, you could probably hire a programmer to fork a 'dead' project and get it working well enough to get your files back), he sort of went all-in.

As a result of this, we got into a long discussion about some way to rate how hindered software was. I pulled in a friend of mine who is good with this stuff (the great Ladon) and we came up with the *Hindrance Index Rating System* (hindrex). Nex really wanted to have a score that he could just apply to stuff, but he also wanted to have a series of criteria to get to that score. He thought it would be too messy to have to explain the criteria each time, so my big contribution was decodable numbering. The idea came from the file permissions on Unix-like systems. After a lot of discussion about what the exact criteria should be, we got a working system going that Nex is going to use when talking about any software in his tutorials.

The idea of rating how hindered software is... actually sounds pretty useful. I've never really seen an easy way to compare software on that kind of criteria with a simple numbering scheme.

In any case, the site has launched and you can see it over at [Nex.RIP](https://nex.rip). The page discussing [Hindrex ratings](https://nex.rip/secrets/hindrex-ratings) has a little coder/decoder that I quickly knocked up---in case you want to use the system in your own reviews.

I'm pretty proud of the rest of the site too. I hooked up all Nex's listening devices to get an accurate widget of what he's been listening to recently. I thought I did a pretty good job with the *comic-book-from-the-future* theming. There's some fun little animations and such kicking about, but I tried not to go overboard. Nex wanted it to be FUNctional first (with the emphasis on the fun).

I'll be continuing to help out with the site for the foreseeable future. Nex isn't so hot with markup, and he'd like my help with explaining some of the technical aspects of the tutorials (hopefully I won't mess that up). It's all quite exciting, and I'm really looking forward to seeing what people make of it all. It'll be nice to hear some new music from Nex too, though he says that might actually be a little while off. He really wants to make sure he's doing the hard work of figuring all this stuff out in a cheap and efficient way, and then proving it works by making a record with the same approach from the tutorials.

Whatever comes of it, it's been great fun so far. Feel free to come along on the journey with us too. You might discover talent you didn't know you had!

Check it all out at [Nex.RIP](https://nex.rip).
