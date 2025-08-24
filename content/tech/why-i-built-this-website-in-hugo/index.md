---
title: 'Why I Built This Website in Hugo'
date: 2017-11-16T10:30:00+00:00
author: John Urquhart Ferguson
description: A description of different types of website creation methods, and why the author chose static site generators (and Hugo in particular) to create this site.
summary: Fast, cheap, and powerful.
readingEase: 10th to 12th Graders
gradeLevel: 12
images:
- images/post-cover.png
categories:
- web-design
tags:
- coding
- hugo
- web design
- static site generators
- emacs
- backstage
- tutorial
draft: false
---

{{< banner src="images/post-cover.png" alt="Hugo Command Line Metrics. Credit: John Urquhart Ferguson & the Hugo Authors" >}}

{{< md-comment >}}
# Instructions

- [ ] Encourage engagement and interaction
- [x] Keep all blog entries as leaf bundles (for example, `hugo new content tech/blog-entry-name` with no .md creates a leaf bundle in the tech section)
- [x] Create a banner image (post-cover.png) in your leaf bundle that is dimensions: 962x520 (1.85:1)
- [x] Still manually add banner image into page content, first thing before anything else using the banner shortcode
- [x] Add any other images you use to the images front matter array (this is purely to help with OpenGraph generation)
- [x] You can use up to two more images in the blog entry, but try not to use any more (unless this is a listicle). Only the banner is essential
- [ ] Try to write 1000 words. The closer to this number, the better, but don't go over (75% of the public prefers reading articles under 1,000 words)
- [x] Reading time should not exceed seven minutes
- [x] Make sure to include a description and summary for the blog entry as these are used on the site and in SEO
- [x] Make an appropriate choice of tags in the front matter. These will help in recommending pages to the reader
- [x] Make an appropriate choice of categories in the front matter. The first category will be used in the breadcrumb for the page, others will generate the side menu
- [x] Use Emacs to generate the reading ease and grade level (this should happen automatically when saving the file in my Emacs configuration). These are just for fun, incidentally, and appear to have no impact on audience engagement
- [x] Set the draft to false when you want to publish, then push to GitHub
- [ ] Drop a video announcing this post on Instagram etc, and post anywhere else you can as well. Reels and videos work better for engagement
- [ ] Consider what tomorrow's article will be, and try to post a new one once a day (more is fine)
{{</ md-comment >}}

An email has come flooding in to request information about the software I use to generate this site. So then, technically minded readers and enthusiastic neophytes alike, let us take a journey into the web.

One of the benefits of doing my writing in [Emacs](https://www.gnu.org/software/emacs/) is that I'm able to write everything in one place, and then 'publish' it to lots of different places. This is the 'write once, publish everywhere' paradigm that I'm rather fond of, and means I have a 'single source of truth' for all my writing.

This site is one of those places. To work neatly with my Emacs setup, it was important that I chose a system that fits the 'write once, publish everywhere' philosophy. The software I use to achieve that is [Hugo](http://gohugo.io/).

I should note that Hugo is not the only web software that would have worked with my writing setup. In fact, there are probably a great number of systems that might have done as good a job. However, I chose Hugo for particular reasons which I will detail here. Additionally, I happen to like Hugo's design, even if that is somewhat subjective on my part.

Before I tell you why I chose Hugo, let us look at how sites today are being made. Simplifying things greatly, let us say that there are three ways to make a website:

- Manual Static Creation
- Dynamic Generation
- Static Generation


## Manual Static Creation
The simplest way to make a site (and the original way) is to create it once, in full, then upload it to a web server. Each time a visitor comes to your site, they will see the same thing, unless you go through the time-consuming process of updating the entire site and uploading it again.

The benefits of this method are its simplicity, cost, and loading speed. It doesn't require databases or other fancy server features (which tend to cost more money), it's secure, and it will load quickly for your visitors.

The downsides are that the sites are time-consuming to update, and not dynamic to user input.


## Dynamic Generation
These sites are more complicated to create, and usually require a database and language processor on the server (which often costs more money). However, these sites have the ability to update themselves based on content from other sources (such as other sites or the site's visitors). This makes it easier to serve content for a specific user, and to have all the content on the site dynamically refactor itself and provide relevant "You might also like..." links to other pages as they are added.

One benefit of this system is producing sites that are easier to update (you can often add single items of content through the site itself without needing to update the whole site and upload it manually). The sites are also more dynamic: content can be pulled in from visitors and other sources; menus and links can automatically update to display new content; and content can be customised for each visitor.

The downsides are numerous. Sites are less secure (requiring you to spend time patching the site software). If you use third party sources or visitor content then you must monitor what content appears on your site. Dynamic sites are generally complicated to set up, and they usually cost more because of the databases and other server features that they rely on. These sites also tend to load more slowly because they need to generate their content on-the-fly. Depending on how good your server is, this could make the site a lot less fun for your readers to use.


## Static Generation
Between static creation and dynamic generation we have a middle ground. Statically generated sites are generated in one go before they are uploaded to a server. The idea here is to make the sites easier to update, but not require the databases and server scripting languages of dynamic generators. Once the site is uploaded, it will appear the same for each visitor with no auto-generated content.

The benefits then are: ease of updating; menu systems and other links being automatically created; no requirement for databases or fancy server features; generally secure; and fast to load.

The downsides are that the sites are less dynamic than fully dynamically generated sites, and they aren't tailored to each visitor.

Hugo is in this last category. I wanted a static generator solution because this site will only be updated sporadically, and I didn't feel unique visitor content or public comments would be useful in this case. I also wanted the ease of updating through my writing system, and most static site generators deal better with this than the other two methods. It's also possible to still have dynamic content on statically generated sites, but this must be done on the user's computer, rather than on the server. This method involves calling on third party services using JavaScript (known as the Jamstack).

There are lots of static site generators around, but I went for Hugo because it seemed to work the way I would expect such a system to work. As such, the learning process was pretty straightforward for me. When I investigated other systems, they seemed much more complicated (and often needlessly so, because Hugo also seemed more powerful and flexible). Hugo is also incredibly fast, and requires only one program file to work (meaning I can archive that file along with the site to make sure I can continue generating the site in the future).

In Hugo, all the files that tell the site how to look, and what content to display are on my computer. When I run the Hugo program, it converts all those files into the site. After the site is initially set up, all you have to do is add content files and Hugo takes care of the rest. It can also be made to integrate beautifully with GitHub pages and/or Netlify, meaning you can essentially get a professional site online, with complete control over how it looks and operates, without it costing you a penny. And all operated directly from within Emacs (if that's your bag... I know mine is).

Hugo also provides a local live server, meaning that anytime you update the source files, you can immediately see the results in a web browser before you publish it online. And, because Hugo is so fast at generating the site, I really do mean *immediately see the results*.

I won't discuss more details about Hugo here, as it is a complex topic, but I hope I have given you enough information to investigate it yourself. If you have the dream to create a powerful and professional site that is totally customised to your needs, loads fast for your users, gives you live feedback during development, and can be deployed without spending any money, then Hugo may well be worth your time to learn.
