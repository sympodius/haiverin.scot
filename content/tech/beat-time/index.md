---
title: '.beat time'
date: 2025-08-23T11:44:17+01:00
author: John Urquhart Ferguson
description: An article about Swatch Internet Time, also known as .beat time. The reasons for its existence, as well as its pros and cons, are discussed. Code to convert to and from .beat time is provided, as is a working example that the visitor can use directly on the page.
summary: Arranging online meetups just got a whole lot easier... in 1998.
readingEase: 8th/9th Graders
gradeLevel: 11
images:
- images/post-cover.png
categories:
- coding
tags:
- beat-time
- swatch-internet-time
- beats
- internet-time
- programming
- coding
- javascript
- emacs-lisp
- elisp
- emacs
- swatch
- tutorial
draft: false
---

{{< banner src="images/post-cover.png" alt="Traditional Clock Face Incorporating .beat time. Credit: John Urquhart Ferguson" >}}

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
- [x] Make sure to include a description and summary for the blog entry as these are used on the site and in SEO
- [x] Make an appropriate choice of tags in the front matter. These will help in recommending pages to the reader
- [x] Make an appropriate choice of categories in the front matter. The first category will be used in the breadcrumb for the page, others will generate the side menu
- [x] Use Emacs to generate the reading ease and grade level (this should happen automatically when saving the file in my Emacs configuration). These are just for fun, incidentally, and appear to have no impact on audience engagement
- [x] Set the draft to false when you want to publish, then push to GitHub
- [ ] Drop a video announcing this post on Instagram etc, and post anywhere else you can as well. Reels and videos work better for engagement
- [ ] Consider what tomorrow's article will be, and try to post a new one once a day (more is fine)
{{</ md-comment >}}

Time is something I think about a lot. You can read why in [another post](/arts/currency-of-life/), but I was recently pondering the perception of time on a planetary scale. When I first got access to the Internet, I enjoyed chatting with people from all over the world. It was a great way to experience global diversity; however, I was still restricted to chatting with Internet-enabled English-speakers.

Even though this was broadening my world-view, I was surprised that my Web chats were still restricted by geography: although the Internet theoretically connected me to lots of countries, most weren't in my time zone. While I might be up for chatting in Scotland, someone in Australia might be busy sleeping. Once you added in the cost of Internet access and the technical difficulties of getting online back then, it turned out that most people I spoke to were Europeans or Americans---usually with an interest in technology.

Increasing the breadth of people I could chat with meant pre-arranging a time; but arranging meetings across time zones was a complicated procedure. Any planned rendezvous usually involved learning someones location, looking up the time zone of that location, determining the offset from your own time zone, calculating any active daylight saving time, and then saying something like, "Let's meet up at 6 pm, your time."

It's that 'your time' which always bothered me.

Putting aside Einstein for the moment; we largely share time. My time is your time, as your time is my time, and our time is all together. Why then must we complicate the world with time zones? Well, quite a lot of it has to do with the perception of what 'noon' means, as well as how the British would use meridians to accurately navigate the seas. But in the World Wide Web none of those things make a lot of sense; the Internet is virtual, and not bound by such physical limitations.

In the late 1990s, this conclusion was shared by Swiss watchmaker, Swatch. In a bid to generate money from the rapidly growing Internet phenomenon, Swatch decided to have a bash at creating an international metric time system, and called it Swatch Internet Time (though the term used within my social circle was "*.beat time*"). Swatch produced and sold a series of *.beat* capable watches in order that anyone online could say, "Let's meet @792," and for that to be the same time no matter where you were in the world. There were 1000 *.beats* in a day (meaning each one lasted 86.4 seconds). There were no time zones when using *.beats*, and no daylight saving time.

I was always rather taken with the idea of *.beat time* (which happened to be introduced just as I got the Internet in 1998), and I was a little disappointed that it didn't take off. I remember it being used on a few sites back then, and in some chatting apps, but it never really became mainstream.

Yet, this problem still exists. I still chat with people all over the world, and I still find it hard to coordinate meeting times. The *.beat time* concept still seems like a pretty good solution to me. I suppose if the might of Swatch couldn't make it happen, I probably won't succeed; but I'd still like to keep the concept alive. As such, I've added the current *.beat time* below. You can keep this window in view and check *.beats* whenever you like. And if you want to set up a meeting with someone using *.beat time*, then you can use the little converter I've coded up alongside it. I've got the current Coordinated Universal Time (UTC/GMT) there as well so that you can work things out according to your local time. There are some smartwatch apps around that will display *.beat time* as well. Check your app store.

{{< center >}}<span style="font-size: x-large;">current <em>.beat time</em> is <strong>{{< beat-time >}}</strong></span>{{</ center >}}

<span style="font-size: large;">current <em>UTC time</em> is <strong>{{< utc-time >}}</strong></span>

{{< beat-time-converter >}}

But here we must raise an important point: why not just use UTC?

For one thing, it does away with any concept of AM/PM... but then UTC times are usually given in the 24-hour time standard.

My main argument for *.beat time* is that it's actually a little more precise for arranging meetings. Now, naturally, UTC works down to the second, so shouldn't it be more accurate? You'd think so, but any time someone arranges a meeting with me in UTC, it's rounded to the nearest five minutes. I think *.beats* being less precise actually makes it more likely that people will stick to times within 86.4 seconds, rather than within 300 seconds. Rounding *.beats* to the nearest five is less likely because that would mean pushing things to the nearest 7.2 minutes, which is too broad a range.

Or... maybe not. Maybe I just think it's cool to give all my meeting times with three digits. Maybe I just enjoy a little more novelty and whimsy in my day. But maybe... it's just a little more fun.


## Code

As an aside (and on the off-chance I've convinced you to include *.beat time* in your own projects), I thought I'd include some code snippets to help you along your way. I've included the basic JavaScript snippet that powers this page, as well as some Elisp functions for the Emacs users amongst you.


### JavaScript

```javascript {linenos=inline style=nord}
function currentBeatTime() {
  let now = new Date();
  let hours = now.getUTCHours();
  if (hours == 23) {
    hours = 0;
  } else {
    hours++;
  }
  let minutes = now.getUTCMinutes();
  let seconds = now.getUTCSeconds();
    
  return Math.round(((((hours * 60) + minutes) * 60) + seconds) / 86.4);
}
```


### Emacs Lisp (Elisp)

```emacs-lisp {linenos=inline style=nord}
(defun beat-time-from-UTC-construct (utc-hours utc-minutes utc-seconds)
  "Given a time in UTC hours, minutes, and seconds, return the .beat time."
  (round (/ (+ (* (+ (* (if (= utc-hours 23) 0 (+ utc-hours 1)) 60) utc-minutes) 60) utc-seconds) 86.4)))

(defun beat-time-string-from-UTC-construct-strings (utc-hours utc-minutes utc-seconds)
  "Given a UTC time (broken down into hours minutes and seconds), give the corresponding .beat time."
  (interactive (list (read-string "UTC hours (as HH)? ")
                     (read-string "UTC minutes (as MM)? ")
                     (read-string "UTC seconds (as SS)? ")))
  (message (concat "@" (number-to-string (beat-time-from-UTC-construct (string-to-number utc-hours) (string-to-number utc-minutes) (string-to-number utc-seconds))))))

(defun beat-time-from-UTC-string (utc-string)
  "Given a UTC time (as HH:MM:SS), give the corresponding .beat time."
  (interactive (list (read-string "UTC time (as HH:MM:SS)? ")))
  (beat-time-string-from-UTC-construct-strings (substring utc-string 0 2) (substring utc-string 3 5) (substring utc-string 6)))

(defun beat-time ()
  "Give the current system time as .beat time."
  (interactive)
  (if (called-interactively-p 'any)
      (message (concat "@" (number-to-string (beat-time-from-UTC-construct (decoded-time-hour (decode-time (current-time) t nil)) (decoded-time-minute (decode-time (current-time) t nil)) (decoded-time-second (decode-time (current-time) t nil))))))
    (beat-time-from-UTC-construct (decoded-time-hour (decode-time (current-time) t nil)) (decoded-time-minute (decode-time (current-time) t nil)) (decoded-time-second (decode-time (current-time) t nil)))))

(defun UTC-string-from-beat-time-string (beat-time-str)
  "Given a .beat time, give the corresponding UTC time."
  (interactive (list (read-string ".beat time? ")))
  (let* ((seconds (* (if (> (string-to-number beat-time-str) 999) 999 (string-to-number beat-time-str)) 86.4))
         (hours (floor (/ seconds 3600)))
         (minutes (floor (/ (- seconds (* hours 3600)) 60))))
    (if (= hours 0) (setq hours 24))
    (message (concat (if (< (- hours 1) 10) (concat "0" (number-to-string (- hours 1))) (number-to-string (- hours 1))) ":" (if (< minutes 10) (concat "0" (number-to-string minutes)) (number-to-string minutes)) ":" (if (< (floor (mod seconds 60)) 10) (concat "0" (number-to-string (floor (mod seconds 60)))) (number-to-string (floor (mod seconds 60))))))))
```
