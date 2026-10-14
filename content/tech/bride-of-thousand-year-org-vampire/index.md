---
title: 'Bride of Thousand Year Org Vampire'
date: 2026-10-14T08:48:57+01:00
author: John Urquhart Ferguson
description: "Play a full game of Thousand Year Old Vampire in Emacs: pull the book's prompts into your Org file as data in this sequel to Thousand Year Org Vampire."
summary: Marrying the book's prompts to the Org file.
readingEase: 7th Graders
gradeLevel: 10
images:
- images/post-cover.png
categories:
- emacs
- coding
tags:
- thousand-year-old-vampire
- emacs
- org-mode
- literate-programming
- coding
- elisp
- hashing
- programming
- emacs-lisp
- tutorial
- rpg
- tim-hutchings
draft: false
---

{{< banner src="images/post-cover.png" alt="Two interlocking SHA-256 wedding rings, one pink and one purple. Credit: John Urquhart Ferguson" >}}

{{< md-comment >}}
# Instructions

- [ ] Encourage engagement and interaction
- [x] Keep all blog entries as leaf bundles (for example, `hugo new content tech/blog-entry-name` with no .md creates a leaf bundle in the tech section)
- [x] Create a banner image (post-cover.png) in your leaf bundle that has a ratio of 1.85:1, and is no smaller than: 962x520 pixels (Ideally 1536x830 or greater)
- [x] Still manually add banner image into page content, first thing before anything else using the banner shortcode
- [x] Add any other images you use to the images front matter array (this is purely to help with OpenGraph generation)
- [x] You can use up to two more images in the blog entry, but try not to use any more (unless this is a listicle). Only the banner is essential
- [ ] Try to write 1000 words. The closer to this number, the better, but don't go over (75% of the public prefers reading articles under 1,000 words)
- [ ] Reading time should not exceed seven minutes
- [x] Make sure to include a description and summary for the blog entry as these are used on the site and in SEO. Ideally the summary should be short and engaging to entice readers. The description is for webcrawlers and should be around 150 characters (no more than 160)
- [x] Make an appropriate choice of tags in the front matter. These will help in recommending pages to the reader
- [x] Make an appropriate choice of categories in the front matter. The first category will be used in the breadcrumb for the page, others will generate the side menu
- [x] Use Emacs to generate the reading ease and grade level (this should happen automatically when saving the file in my Emacs configuration). These are just for fun, incidentally, and appear to have no impact on audience engagement
- [x] Set the draft to false when you want to publish, then push to GitHub
- [ ] Drop a video announcing this post on Instagram etc, and post anywhere else you can as well. Reels and videos work better for engagement
- [ ] Consider what tomorrow's article will be, and try to post a new one once a day (more is fine)
{{</ md-comment >}}

For Halloween last year, I posted an [article](/tech/thousand-year-org-vampire/) about the [Tim Hutchings](https://thousandyearoldvampire.com/) solo role-playing game *[Thousand Year Old Vampire](https://timhutchings.itch.io/tyov)*. I feel honoured that Tim mentioned it in his newsletter, and I'm gratified that people found the post interesting.

Of course, it was also a sneaky way of letting me write about [Emacs](/tags/emacs/), [Org Mode](/tags/org-mode/), and [literate programming](/tags/literate-programming/).

I don't want to rehash the same ground I covered last year, but I did end that article with a homework assignment for you all: to integrate the book's prompts so that you could play an entire game of *TYOV* with just one Emacs Org file. I think it's time I wrote up my own solution to that problem, so I present to you: *Bride of Thousand Year Org Vampire*!

If you've not read the [previous post](/tech/thousand-year-org-vampire/), you'll need to do that before we move on...

All done? Great!

All the code from last year will still be used in this updated version. We're not going to recode anything, but rather build on top of what we already have. Let's start by creating a new heading called *Private Gameplay Functions*. Since this new version of the file will end up storing the copyrighted prompts from the book, you absolutely cannot distribute it without the express permission of [Tim Hutchings](https://thousandyearoldvampire.com/). In order to isolate the parts of the file that deal with these personal-use sections, I'm labelling them all as 'private.'

Working from top-to-bottom like we did last year, the first function we want to exist will simply give us the full text of the next prompt that we have to resolve. It looks like this:

```emacs-lisp {linenos=inline style=dracula}
#+name: get-next-text-prompt
#+begin_src emacs-lisp :tangle no :noweb yes :noweb-prefix no :var next-prompt-number=get-next-prompt()
  <<get-text-prompt-from-number>>
  (let ((prompt-num (string-to-number next-prompt-number)))
    (message "%s---%s" prompt-num (get-text-prompt-from-number prompt-num)))
#+end_src
```

As ever, the literate programming style makes things almost deceptively simple. We have a variable called `next-prompt-number` declared in the header which takes its value from executing the *get-next-prompt* code block. If you remember, *get-next-prompt* was the main interaction point for playing the game last year, and it set off most of the other functions we put in place. It deals with all the game logic to tell us which prompt number from the book to resolve next. However, that's where it ended and it never gave us the actual text. This variable will now store that number. This means that this new *get-next-text-prompt* supersedes the old *get-next-prompt* in terms of how we interact with the game. If we want to get the next prompt number *without* the text, we can run the old function. However, if we want to get the next prompt number *with* the text, we can run the new function. Both will advance the game to the next prompt, so you should never run both at once (because the new one already calls the old one).

This takes a lot of the heavy lifting off our shoulders because the game logic for progression to the next prompt has already been handled by last year's code, and there is no need for us to code any of that up again.

Now that we have the prompt number, we need to look up the text associated with it. That's what `<<get-text-prompt-from-number>>` will do... once we code it up. The rest of the code simply calls `get-text-prompt-from-number`, joins the text to the prompt number, and reports it to the user.

That seems easy enough. So the next thing is coding up the *get-text-prompt-from-number* block, which I'm storing under the heading *Private Worker Functions*:

```emacs-lisp {linenos=inline style=dracula}
#+name: get-text-prompt-from-number
#+begin_src emacs-lisp :tangle no :noweb yes :noweb-prefix no :var prompt-number=1.1 :results silent
  (defun get-text-prompt-from-number (prompt-number)
    (let (<<prompts-text-hash>>)
      (message "%s" (gethash prompt-number prompts-text-hash))))
  (when (boundp 'prompt-number)
    (get-text-prompt-from-number prompt-number))
#+end_src
```

A lot of that code should feel familiar from last year. We've defined a function, given it default values to pass in, and called it when the variables are defined. This allows us to call the code block directly with the default values, override the default values when called from another code block, or to call the function from Emacs LISP code.

The new parts are the `<<prompts-text-hash>>` call, and the `gethash` function. If you're not a programmer, you might be wondering what all this hash stuff is about. A *hash* is the result of a one-way function which turns an input into an output of defined size. It's very fast to create the hash, but very difficult to get the original input back (if you had a machine that could try quadrillion guesses per second and you started it at the Big Bang[^age-of-universe], it would still be less than a billionth of a billionth of a billionth of a percent of the way through the search for just *one* hash used in this program[^sha-256]). If we make the length of the hash long enough, it becomes unlikely that two different inputs would produce the same one. However, the same input will always produce the same hash. This is often used as a quick way to check that files or data match each other because it is quicker to generate and test hashes than entire swathes of data. It also means that we can check data without having to store an entire copy of the data ourselves. A *hash table* (sometimes called a *hash map* or *dictionary*) is an efficient data structure for information retrieval that runs each key through a hash function and uses the resulting number to address the spot in the table where the matching value is stored. This is also why they are so fast. Looking something up takes the same few steps whether the table holds ten entries or ten thousand, because one hash calculation takes you straight to the spot instead of checking every entry in turn. As such, we'll be storing the game prompts in a hash table. `gethash` then allows us to quickly get the prompt text for a given prompt number.

So, let's have a look at the *prompts-text-hash* code block to see what that data looks like. I have it stored in *Private Variables*. Just so we're clear, though: this block isn't one you run directly, like the function blocks we've seen so far. It exists to be spliced into other code blocks using noweb, where its contents slot into a larger piece of code. It looks like this:

```emacs-lisp {linenos=inline style=dracula}
#+name: prompts-text-hash
#+begin_src emacs-lisp :tangle no :results silent
  (prompts-text-hash nil)
#+end_src
```

But hold on a minute... that's just a variable without any data in it. Where are all the book prompts and their text?

Well, obviously I'm not going to include that, am I? I want you to actually [buy the book](https://timhutchings.itch.io/tyov) and give [Tim Hutchings](https://thousandyearoldvampire.com/) some well-deserved remuneration for creating this awesome game for us to play. However, if you do buy the digital edition of the game, it will come with both a PDF and a text file of the book. When I first made the Org Mode version that included the full text prompts, I manually copied each of the prompts from the text file into that hash table. I did this manually instead of writing a program to do it because there were a number of typos and mistakes in the text file that needed correcting. If you wish to go down this route yourself, the correct format for the hash table would be something like this:

```emacs-lisp {linenos=false style=dracula}
  (prompts-text-hash
   #s(hash-table
      size 300 test eql data
      (1.1 "The text for the first variant of the first prompt of the game."
           1.2 "This time you put in the text for the second variant of the first prompt of the game, and so on until..."
           ...
           80.1 "You add in the text for the final prompt in the game, and you are done.")))
```

If you have the patience to add all the prompts manually then you're done! Congratulations! Homework assignment complete!

From looking at the amount and the simplicity of the code we just added, it was actually a pretty easy homework assignment. Maybe too easy. Perhaps we need to be more ambitious?

What if we wanted to make life easier for someone who owns the book, but doesn't want the hassle of manually copying all the prompts into the Org file themselves? How would we go about that?

Well, let's go back to our top-to-bottom approach. Essentially we need to find a way to take the purchased text file from the book, pull the prompts from it, adjust for errors and typos, then format them into the correct hash table. First things first: let's add a new private variable to store the location of the text file. When I bought the book, it was called "`_Thousand Year Old Vampire.txt`." Assuming the user can copy it into the same folder where the Org file lives, we can add this code to the *Private Variables* section:

```emacs-lisp {linenos=inline style=dracula}
#+TXT_PATH: _Thousand Year Old Vampire.txt
```

I'm storing it as a global Org variable to make it easier for the user to edit if required. With that variable in place, let's look at the first code block we'll need. I've put this into *Private Gameplay Functions* to highlight that it's one I want the user to consider running:

```emacs-lisp {linenos=inline style=dracula}
#+name: pull-prompts-from-file
#+begin_src emacs-lisp :tangle no :noweb yes :noweb-prefix no :var txt-path=get-txt-path() txt-edits=txt-edits() all-prompts=get-all-prompts() :results silent
  <<parse-clean-txt>>
  <<apply-txt-edits>>
  <<set-prompts-text-hash>>
  (let* ((raw-txt (when (file-exists-p txt-path)
                    (with-temp-buffer
                      (insert-file-contents txt-path)
                      (buffer-string))))
         ;; Defensively normalise the text: strip a leading Byte Order Mark [BOM---U+FEFF (ZERO WIDTH NO-BREAK SPACE)/65279] and convert any Windows-style line endings (CRLF) to Unix-style (LF). Files with mixed line endings, in particular, can leave stray \r characters behind that would break parsing.
         (clean-txt (when raw-txt
                      (let* ((byte-order-mark (char-to-string 65279))
                             (no-bom-string (if (string-prefix-p byte-order-mark raw-txt)
                                                (substring raw-txt (length byte-order-mark))
                                              raw-txt)))
                        (replace-regexp-in-string "\r\n" "\n" no-bom-string t))))
         ;; Get hash table of Prompts from clean-txt.
         (parsed-txt (when clean-txt (parse-clean-txt clean-txt))))
    ;; If raw-txt is nil, then the original file was never found, and none of the other processing will have taken place, so inform the user.
    (unless raw-txt
      (user-error "Book file not found: %s. Set #+TXT_PATH to your own copy of the book's original text file (usually called \"_Thousand Year Old Vampire.txt\")." txt-path))
    ;; Check if the Prompts match those expected in terms of amount and numbering. If not, inform the user.
    (let ((found-prompts ()))
      (maphash (lambda (key value)
                 (push (string-to-number key) found-prompts))
               parsed-txt)
      (unless (equal (sort found-prompts) (sort all-prompts))
        (user-error  "Unexpected Prompt amount/numbering found. This is not the expected book text file: %s (the correct text file is usually called \"_Thousand Year Old Vampire.txt\")." txt-path)))
    (let (key
          (prompts-text-hash "(prompts-text-hash\n   #s(hash-table\n      size 300 test eql data\n      (")
          raw-prompt-text
          corrected-prompt-text
          (txt-edits txt-edits)
          <<raw-prompt-text-hashes>>
          <<prompt-text-hashes>>)
      (maphash (lambda (key value)
                 (setq raw-prompt-text (gethash key parsed-txt))
                 ;; If raw-prompt-text matches expected hash, apply corrections. Otherwise, pass straight through.
                 (if (string= (secure-hash 'sha256 raw-prompt-text nil nil nil) (gethash (string-to-number key) raw-prompt-text-hashes))
                     (progn
                       (setq corrected-prompt-text (apply-txt-edits (gethash key parsed-txt) (cdr (assoc (string-to-number key) txt-edits))))
                       (setq prompts-text-hash (concat prompts-text-hash key " \"" corrected-prompt-text "\"\n           "))
                       ;; Check correct text against hash. If wrong, message user but keep going.
                       (unless (string= (secure-hash 'sha256 corrected-prompt-text nil nil nil) (gethash (string-to-number key) prompt-text-hashes))
                         (message "Prompt %s does not contain the expected text" key)))
                   (progn
                     (message "Prompt %s raw text does not match the expected hash; corrections skipped" key)
                     (setq prompts-text-hash (concat prompts-text-hash key " \"" raw-prompt-text "\"\n           ")))))
               parsed-txt)
      (setq prompts-text-hash (concat (string-trim-right prompts-text-hash) ")))"))
      (set-prompts-text-hash prompts-text-hash)
      ;; Now that Prompts have been pulled into the file, display privacy comment on first blank line of file.
      (when prompts-text-hash
        <<add-private-file-comment>>)))
#+end_src
```

That's a lot of code. Probably double the largest code block we had last year. This is often a balance issue when programming. You can almost always split code into smaller and smaller pieces, but sometimes it makes more logical sense to keep it larger. For me, this is usually when I find the logic flow would be harder to follow when too many pieces rely on each other. This is ultimately a subjective choice, but for me this is actually as simple as I want this particular code block to be. Having said that, it still calls lots of other code blocks that we'll need to write up. Before we get to those, let me walk through what this code is doing.

The header gathers a few variables from two code blocks we've not written yet, and one we wrote last year: `txt-path`, `txt-edits`, and `all-prompts`. The first just gets the location of the text file from the variable we just created. The last one gets a list of all the expected prompts in the game from another global variable. The middle one stores all the edits we're going to be making to the prompts. I'll get to those two new ones in a bit, but let's keep going through *pull-prompts-from-file* just now.

We pull in some functions that we'll be calling in the LISP code later in the block, then we get into the real meat of things. First we take in the entire contents of the text file as `raw-txt`. In order to make it work better with our code, we're going to do some defensive clean-up operations on it: making sure there's no Byte Order Mark hanging around at the start, and no Windows-style line endings left in the text. This is belt-and-braces rather than essential, because Emacs's coding system usually handles both for us, but a file with mixed line endings, for example, can leave stray carriage-return characters behind, and those would break the parsing. That gives us `clean-txt`. Once we have that, we can go through the text in the book and pull out the prompts to give us `parsed-txt`. At each stage, we only continue if the previous stage succeeded. If not, we have to stop and inform the user of the failure. Keeping error messages as informative as possible can help them debug the issue, but Emacs will handle most of the situations for us. I've only added in a couple that I think are especially likely to come up.

Once we have all the prompts, we check that the numbering matches what we'd expect from the `all-prompts` variable we made at the start. If it does, we can move on. If not, we need to stop and tell the user.

The next large section of code deals with checking hashes, editing the prompts, and then checking the edited prompts against other hashes. The beauty of all this is that I can (within a reasonable degree of accuracy) determine if the prompts being fed into the program are the ones I expect without having to actually store those same prompts to be compared against. Storing the edits themselves as a list of instructions rather than replacement text also means that I can release this file without infringing on the copyright of the original book. But where did I get all these hashes? Well, I wrote another little program to generate them for me, but I'm not going to include the whole thing here. In short, it was a loop calling a one-way hash function a bunch of times. The hash function itself is called like this:

```emacs-lisp {linenos=false style=dracula}
(secure-hash 'sha256 "Text to be hashed")
```

If I actually ran the code above, it would output the hash `9e466c484be11797cc1e1fffe06b6d9fd21cefa90de79c1ca9c3985adb0338c3`. Whatever text I give it will produce a largely unique hash. But if I give it the same input, it will always produce the same hash. Now I can store that hash and any time I need to verify that the text I'm expecting is "*Text to be hashed*", I can just hash it again and compare the result to what I already have, without ever having to store the real text. I should also note that if the text was one letter, or all the works of Shakespeare, it would still produce a hash exactly the same length when run through that function.

So that's how we can check that the text file matches what we expect it to be without storing a second copy.

The edits themselves are stored as a series of commands that can be applied to each prompt, but only if the prompt matches what we expect the unedited text to be (again, using hashes). When we know it matches, we use a series of instructions in the form of: offset, deletions, and text insertion. And we apply them from right to left to make sure further edits don't have the wrong offset. For example:

```emacs-lisp {linenos=false style=dracula}
(cons 1.2 '((187 0 "/") (194 0 "/")))
```

The code above is for two edits to the 1.2 prompt. The first edit (right to left) would start at position 194 in the string (the offset). From that point, it will delete 0 characters (no deletions needed in that edit). Then, without moving point, insert the `/` character. Once that edit is complete, we move to the next one (right to left). That one starts at position 187. This is why we must move from right to left: if we'd done this edit first, then it would have changed the text appearing at position 194 for the other edit. Going right to left means this will never happen. Again, this edit needs 0 deletions, but then also inserts a `/` character. And that is all the edits for this prompt done. If you're curious, those two slashes become Org markup to tell Emacs to make the text in between display as italic to better match the printed book.

Once the edit is applied, we then run it through another hash computation and compare it against a precomputed hash for the known corrected text. If it matches, we succeeded. If not, we let the user know, but still keep running the program. I've opted to use these hash checks as a means to inform the user that unexpected things have happened, rather than just stop processing. The reason is that future editions of the book text may still process fine, but not have the errors I expect. While this might not be perfect, it would likely still result in a playable version of the game within the Org file.

With all the edits applied and checked, we then store the corrected prompts into that variable we looked at earlier: *prompts-text-hash*. The process is essentially complete at this point, but I've added one extra step at the end. A last function that adds a comment to the start of the file to remind the user in a very clear way that this Org file has now been altered to include the copyrighted text and therefore cannot be distributed. It's just a helpful little thing to make sure people don't accidentally think they're still using the old file and distribute it.

So, that was quite a lot of stuff to do in one code block, but hopefully you can see how it still felt like one logical operation to me and why I didn't want to split it up any further. But now we have to go through the calls to the things I did split up and see how they work. First up is *get-txt-path()* (which I've put into the *Private Worker Functions* section):

```emacs-lisp {linenos=inline style=dracula}
#+name: get-txt-path
#+begin_src emacs-lisp :tangle no :results silent
  (when (derived-mode-p 'org-mode)
    (save-excursion
      (let ((regexp (format "^[ \t]*#\\+%s:" (regexp-quote "TXT_PATH")))
            (case-fold-search t))
        (goto-char (point-min))
        (when (re-search-forward regexp nil t)
          (string-trim (buffer-substring (point) (line-end-position)))))))
#+end_src
```

This is a very straightforward function of the kind that we discussed lots last year, so I'm not going to go into it again. It simply reads the variable for where the text file is stored (`#+TXT_PATH:`) and returns it. Next up is *txt-edits()* in *Private Variables*:

```emacs-lisp {linenos=inline style=dracula}
#+name: txt-edits
#+begin_src emacs-lisp :tangle no :results silent
  (list (cons 1.1 '((20 1 "") (135 0 "/") (147 0 "/")))
        (cons 1.2 '((187 0 "/") (194 0 "/")))
        (cons 1.3 '((185 0 "/") (202 0 "/") (210 0 " ") (255 1 "")))
        (cons 2.1 '((140 0 ".")))
        (cons 2.3 '((188 0 "/") (197 0 "/")))
        (cons 3.2 '((143 0 "/") (159 0 "/")))
        (cons 3.3 '((24 1 "'")))
        (cons 4.2 '((59 0 " ") (135 0 "/") (151 0 "/")))
        (cons 5.2 '((15 1 "'")))
        (cons 7.3 '((36 1 "")))
        (cons 8.2 '((132 0 " ")))
        (cons 8.3 '((15 1 "'") (198 0 "/") (211 0 "/")))
        (cons 9.3 '((150 0 "/") (169 0 "/") (243 1 "")))
        (cons 11.1 '((66 0 "/") (70 0 "/")))
        (cons 11.2 '((126 0 "/") (145 0 "/")))
        (cons 12.3 '((124 1 "---")))
        (cons 13.1 '((227 0 "/") (250 0 "/")))
        (cons 16.2 '((95 1 "'") (97 3 "---c")))
        (cons 20.3 '((119 0 "/") (123 0 "/") (213 1 "'")))
        (cons 21.1 '((64 0 " ")))
        (cons 21.3 '((159 0 " ")))
        (cons 22.2 '((0 106 "Your Diary is lost or stolen. Lose the Diary and all Memories it contains. If you have no Diary, lose one Resource. Create a Character who you wrongly blame for this loss.")))
        (cons 22.3 '((140 0 "/") (153 0 "/")))
        (cons 24.2 '((49 1 "'")))
        (cons 26.3 '((264 3 "---f")))
        (cons 27.3 '((103 0 "/") (110 0 "/")))
        (cons 28.1 '((6 1 " ")))
        (cons 29.1 '((134 3 "---h")))
        (cons 30.3 '((55 0 "/") (62 0 "/")))
        (cons 31.1 '((56 0 " ")))
        (cons 31.2 '((82 0 ",")))
        (cons 31.3 '((170 1 "'")))
        (cons 32.1 '((56 1 "'")))
        (cons 33.3 '((52 3 "---g") (242 0 "/") (263 0 "/")))
        (cons 36.2 '((105 0 "/") (116 1 "'") (123 0 "/")))
        (cons 37.2 '((50 0 "/") (54 0 "/")))
        (cons 38.3 '((72 0 "/") (85 0 "/") (121 3 "--t")))
        (cons 39.1 '((34 0 " ")))
        (cons 39.3 '((44 0 " ")))
        (cons 40.3 '((203 0 "/") (219 0 "/")))
        (cons 41.3 '((105 1 " ")))
        (cons 43.3 '((317 1 "\\\"") (327 1 "\\\"")))
        (cons 44.1 '((25 1 "'")))
        (cons 44.2 '((55 0 "/") (60 0 "/")))
        (cons 46.2 '((122 0 "/") (130 0 "/") (132 0 "/") (141 0 "/") (143 0 "/") (156 0 "/") (161 0 "/") (172 0 "/")))
        (cons 47.1 '((37 1 "'") (174 5 "")))
        (cons 48.1 '((136 0 " ")))
        (cons 48.3 '((493 0 "/") (531 0 "/")))
        (cons 49.2 '((54 1 "") (156 1 "") (183 1 "")))
        (cons 52.2 '((54 1 "'") (88 3 "---c")))
        (cons 54.1 '((73 1 "")))
        (cons 56.1 '((143 0 "/") (152 0 "/")))
        (cons 56.3 '((3 1 "'")))
        (cons 58.2 '((159 1 "'")))
        (cons 59.1 '((41 1 " ")))
        (cons 59.2 '((24 1 "")))
        (cons 59.3 '((10 1 "'") (175 0 ",")))
        (cons 60.2 '((167 0 "/") (169 1 "'") (190 0 "/")))
        (cons 60.3 '((78 0 "/") (101 0 "/")))
        (cons 61.2 '((75 0 "/") (80 1 "") (98 6 "") (115 0 "/")))
        (cons 62.1 '((236 1 "'")))
        (cons 62.3 '((136 0 ",")))
        (cons 63.3 '((104 0 "/") (112 0 "/")))
        (cons 64.2 '((22 1 "'"))))
#+end_src
```

This is really just a big variable storing all the edits that I felt needed to be made to the prompts stored in the text file version of the book. Some of it is correcting actual typos, and other bits are adding some Org markup to make things display nicer in Emacs. However, one edit (and I hope Tim won't get mad at me for doing this) actually contains the full prompt. The reason for this is that prompt 22.2 is not included in the official text file of the book. Instead, prompt 22.1 is just repeated. As such, this was the only sensible way to get things to work. However, since one prompt alone really isn't of use to anyone, I hope this won't be out of line.

The first of the more interesting bits of code is *parse-clean-txt* (stored in *Private Worker Functions*):

```emacs-lisp {linenos=inline style=dracula}
#+name: parse-clean-txt
#+begin_src emacs-lisp :tangle no :var new-clean-txt="" :results silent
  (defun parse-clean-txt (clean-txt)
    (with-temp-buffer
      (insert clean-txt)
      (goto-char (point-min))
      (let* ((in-section nil)
             (found nil)
             (current nil)  ; The current Prompt being processed, stored as an assoc list: (KEY . LINES)
             (table (make-hash-table :test 'equal)))
        (while (not (eobp))  ; eobp is the end of buffer predicate, which is faster here than my usual check that point is less than point-max
          (let* ((line (string-trim (buffer-substring-no-properties (point) (line-end-position)))))  ; Don't get text properties (to improve performance)
            (cond
             ;; Prompts section not yet found.
             ((not in-section)
              ;; Only say we're in this section after the first encountered "Prompts" heading.
              (when (and (not found) (equal line "Prompts"))
                (setq in-section t
                      found t)))
             ;; When line matches at least three underscores, we've just left the main Prompts section. Tidy up final found Prompt before closing out section.
             ((string-match "^[_]\\{3,\\}$" line)
              (when current
                (puthash (car current) (mapconcat #'identity (cadr current) " ") table)
                (setq current nil))
              (setq in-section nil))
             ;; Either the Prompt number and variant, or Prompt number and variant followed immediately by the Prompt (5 groups total: 1--5).
             ((string-match "^\\([0-9]+\\)\\([abc]\\)$\\|^\\([0-9]+\\)\\([abc]\\)\\. \\(.*\\)$" line)
              ;; Add match from previous loop iteration to hash table.
              (when current
                (puthash (car current) (mapconcat #'identity (cadr current) " ") table)
                (setq current nil))
              ;; Set current match to be processed on next loop iteration.
              (setq current (list (concat (or (match-string 1 line) (match-string 3 line))  ; If line matches either group 1 or 3 from above, get Prompt number for key
                                          ;; If line matches either group 2 or 4, then convert to number, where a=1, b=2, c=3, and add to subvariant for key.
                                          (if (string= (or (match-string 2 line) (match-string 4 line)) "a")
                                              ".1"
                                            (if (string= (or (match-string 2 line) (match-string 4 line)) "b")
                                                ".2"
                                              ".3")))
                                  ;; If line matched group 5, get Prompt as value and attach to key.
                                  (if (match-string 5 line)
                                      (list (match-string 5 line))
                                    nil))))
             ;; Empty line. Process match from previous loop iteration to hash table.
             ((string-empty-p line)
              (when current
                (puthash (car current) (mapconcat #'identity (cadr current) " ") table)
                (setq current nil)))
             ;; Still not reached end of current Prompt, so add to current for further processing in next loop iteration.
             ((when current
                (setf (cadr current) (append (cadr current) (list line)))))))
          (forward-line 1))
        ;; Catch any outstanding Prompts at end of loop (should hopefully never actually get called).
        (when current
          (puthash (car current) (mapconcat #'identity (cadr current) " ") table)
          (setq current nil))
        ;; If Prompts section was never found, or we didn't find the end of it, report an error to the user.
        (unless found
          (user-error "parse-clean-txt: structural failure, no \"Prompts\" heading found in the txt file (wrong file?)"))
        (if in-section
            (user-error "parse-clean-txt: structural failure, no underline separator found after the Prompts section (corrupt text file?)")
          table))))  ; Return the hash table of Prompts
  (when (boundp 'new-clean-txt)
    (parse-clean-txt new-clean-txt))
#+end_src
```

Yikes. Another big block. Despite the size, this code is actually not very interesting (though the logic flow was tricky enough that I added a lot more comments than usual). The code just walks through the cleaned text file until it finds the "Prompts" section, then pulls out each prompt and stores it for further processing. The only tricky thing is that some of the prompts exist across multiple lines (I suspect this was an error when making the text file). So that means we just keep collecting lines on each pass through the loop until we're certain the prompt has ended. Only then do we process it.

Once we reach the end of the "Prompts" section, we tidy up the prompts and we're done with this part of the code. The next section is *apply-txt-edits* in *Private Worker Functions*:

```emacs-lisp {linenos=inline style=dracula}
#+name: apply-txt-edits
#+begin_src emacs-lisp :tangle no :var new-text="" new-operations=() :results silent
  (defun apply-txt-edits (text operations)
    (dolist (operation (sort operations (lambda (a b) (> (car a) (car b)))))
      (let* ((offset (car operation))
             (del-n (nth 1 operation))
             (insert-txt (nth 2 operation)))
        (unless (and (integerp offset) (>= offset 0) (<= offset (length text))
                     (integerp del-n) (>= del-n 0) (<= (+ offset del-n) (length text)))
          (user-error "apply-txt-edits: operation \"%s\" out of bounds for text of length %d" operation (length text)))
        (setq text (concat (substring text 0 offset)
                           insert-txt
                           (substring text (+ offset del-n))))))
    text)
  (when (and (boundp 'new-text) (boundp 'new-operations))
    (apply-txt-edits new-text new-operations))
#+end_src
```

Ah, a more manageable code block this time, though still not especially interesting. It simply takes a prompt and its edit operations, then applies them. The one important thing is that it first checks that an operation is actually valid before attempting to carry it out. This just means that the offset for the edit must be within the prompt length, and that the deletions cannot exceed the length of the prompt after the offset.

Moving on, we have *set-prompts-text-hash* in *Private Worker Functions*:

```emacs-lisp {linenos=inline style=dracula}
#+name: set-prompts-text-hash
#+begin_src emacs-lisp :tangle no :var new-text-hash=() :results silent
  (defun set-prompts-text-hash (text-hash)
    (when (derived-mode-p 'org-mode)
      (save-excursion
        (let ((regexp (format "^[ \t]*#\\+name: prompts-text-hash[ \t]*\n[ \t]*#\\+begin_src emacs-lisp\\( [^\n]*\\)?\n"))
              (case-fold-search t)
              beg)
          (goto-char (point-min))
          (when (re-search-forward regexp nil t)
            (setq beg (point))
            (when (re-search-forward "^[ \t]*#\\+end_src\\b" nil t)
              (delete-region beg (match-beginning 0))
              (goto-char beg)
              (insert "  " (string-trim-right text-hash) "\n")))))))
  (when (boundp 'new-text-hash)
    (set-prompts-text-hash new-text-hash))
#+end_src
```

Here we have another block reminiscent of those from last year (specifically the *set-used-prompts* block). This time, however, we have a slightly more complicated search pattern for where to place the output, and we need to place it between two known bits of text, rather than at the end of a single line. I won't go into the search pattern, but placing it between two bits of known text involves remembering where the first bit of known text started, then searching for the second bit of known text. Once you have both, you can delete the space between them and inject the new text. In our case, this will be all the text prompts for the game.

At this point we've dealt with most of the logic in the program, but we still have some code blocks that store variables: *raw-prompt-text-hashes* and *prompt-text-hashes*. These are just collections of the hashes that we compare the prompts to before and after the edits are applied. They look like this in *Private Variables*:

```emacs-lisp {linenos=inline style=dracula}
#+name: raw-prompt-text-hashes
#+begin_src emacs-lisp :tangle no :results silent
  (raw-prompt-text-hashes
   #s(hash-table
      size 300 test eql data
      (1.1 "c82ddac8a344bbeafa537971e063b52b848248271666b8b66a174777b462cbb0"
           1.2 "112b836f2327748da56b4bb36b67a290187063a5721e00c6a6b37bace8ff365a"
           ...
           80.1 "0092a6d01dfdf0081e9521c4effb49873f165095090c00b827312468898118f7")))
#+end_src

#+name: prompt-text-hashes
#+begin_src emacs-lisp :tangle no :results silent
  (prompt-text-hashes
   #s(hash-table
      size 300 test eql data
      (1.1 "b419c0ab233a7b12be5bc67b1309780d19728eaf17480381fc1c370827aa1f8e"
           1.2 "dd44f27079119907854b82e73c562358a990ca6a22eefe1756f3407d162c888f"
           ...
           80.1 "0092a6d01dfdf0081e9521c4effb49873f165095090c00b827312468898118f7")))
#+end_src
```
They're far too long and boring for me to include in full within the article though, so I've mercifully added some ellipses in there just to give you the idea. You can see them in full in the completed Org file[^BOTYOV.org].

At this point, we're functionally done, but there's still that code adding a comment to remind the user not to distribute the file now that it has the full prompts. It's in *Private Worker Functions*:

```emacs-lisp {linenos=inline style=dracula}
#+name: add-private-file-comment
#+begin_src emacs-lisp :tangle no :noweb yes :noweb-prefix no :results silent
  (let* (<<private-file-intro-comment>>
         (comment-regexp (format "%s" (regexp-quote private-file-intro-comment)))
         (case-fold-search t))
    (when (derived-mode-p 'org-mode)
      (save-excursion
        (goto-char (point-min))
        ;; Check that comment doesn't already exist before adding.
        (unless (re-search-forward comment-regexp nil t)
          (while (and (< (point) (point-max))
                      (not (looking-at "^[ \t]*$")))
            (forward-line))
          (when (and (= (point) (point-max))
                     (not (bolp)))  ; bolp is the beginning of line predicate
            (insert "\n"))
          (insert private-file-intro-comment)))))
#+end_src
```

A nice straightforward code block there. It just looks for the first blank line in the file and adds in the comment. Of course, it only does that if it can't already find the comment. This could actually be a problem for us, because we need to store that comment within the file in order to insert it after the prompts are added. The file therefore contains the text of the comment from the very start, so a simple check for whether it is present would always find it, and the comment would never get inserted. But the stored text is a Lisp string full of escape sequences, and that is not what the search looks for. The search is built from the actual value of the string, which is the exact text, with real line breaks, that gets inserted. So the search only ever finds a comment that has genuinely been added, and running the process twice won't add a second one on top.

Another minorly interesting thing is that the comment still gets inserted even if it never finds a blank line in the file (highly unlikely though that may be). If the search gets to the very end of the file and it's still not on the beginning of a line, it creates a new line and puts the comment in anyway.

The actual comment isn't stored in that block, though. It's in *Private Variables*:

```emacs-lisp {linenos=inline style=dracula}
#+name: private-file-intro-comment
#+begin_src emacs-lisp :tangle no :results silent
  (private-file-intro-comment "\n#+begin_comment\n*THIS IS A PRIVATE VERSION OF THIS FILE, AND NOT FOR PUBLIC RELEASE!*\n\nReplace the contents of the =prompts-text-hash= source block with =(prompts-text-hash nil)=, then delete this comment block before sharing this file with anyone.\n\nI'd also recommend resetting the =Play Space= if you don't want anyone seeing your current game.\n#+end_comment\n")
#+end_src
```

And that's us! If a user has a legitimate copy of the book text file, they can place it in the same directory as the Org file, run the *pull-prompts-from-file* code block, and they'll have a completely self-contained version of the game. From there, they can play by running *get-next-text-prompt* instead of *get-next-prompt* (but all the other code blocks in *Gameplay Functions* will work just as before). Delightful!

I think it's fair to say that the original homework assignment with the manual labor of copying the prompts in might have been less work than this fully automated solution. That can sometimes be the way with programming. I've often found myself in situations where I had to weigh up whether it was worth my time to code something up rather than just doing it manually. Most of the time, that depends on how often I expect to need to do it. In the case of this little Org file, I only personally needed to do the manual labor once. But for you, dear readers, I have coded it up so that you never have to do it all---not even once. As with last year, I am including a completed Org file that does everything this tutorial covered, so please feel free to download [the complete, finished file for *Bride of Thousand Year Org Vampire*](BrideOfThousandYearOrgVampire.org)[^BOTYOV.org]. It should work fine in all recent versions of Emacs.

This year's tutorial on literate programming was a lot more complex than last year. Can you imagine how bad it would have been if I'd actually gone into the proper depth about what all the code was doing? Still, even if you didn't manage to follow along with the article, I hope you'll enjoy the wonderful game by [Tim Hutchings](https://thousandyearoldvampire.com/) (please do [buy a copy](https://timhutchings.itch.io/tyov), because it's awesome), and I hope this new version makes it even more enjoyable to play within Emacs Org Mode.

As ever: stay safe, be creative, and share what you can. Happy Halloween, everyone!

<h2 class="footnotes">Footnotes</h2>

[^age-of-universe]: Assuming the Universe is 13.8 billion years old: [NASA StarChild — How old is the universe?](https://starchild.gsfc.nasa.gov/docs/StarChild/questions/question28.html)
[^sha-256]: The SHA-256 specification: [NIST FIPS 180-4, Secure Hash Standard](https://csrc.nist.gov/files/pubs/fips/180-4/final/docs/fips180-4.pdf)
[^BOTYOV.org]: Download the completed file: [BrideOfThousandYearOrgVampire.org](BrideOfThousandYearOrgVampire.org)
