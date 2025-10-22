---
title: 'Thousand Year Org Vampire'
date: 2025-10-20T13:10:51+01:00
author: John Urquhart Ferguson
description: A tutorial on playing the Tim Hutchings solo role-playing game, Thousand Year Old Vampire, within Emacs Org Mode. An exploration of literate programming is used to describe the full possibilities available in playing such games within Emacs Org Mode.
summary: Playing a solo RPG inside Emacs Org Mode.
readingEase: 8th/9th Graders
gradeLevel: 13
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
- programming
- emacs-lisp
- tutorial
- rpg
- tim-hutchings
draft: false
---

{{< banner src="images/post-cover.png" alt="The play space of 'Thousand Year Old Vampire' inside Emacs Org Mode, using the 'Dracula' colour scheme by Zeno Rocha. Credit: John Urquhart Ferguson" >}}

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
- [x] Make sure to include a description and summary for the blog entry as these are used on the site and in SEO
- [x] Make an appropriate choice of tags in the front matter. These will help in recommending pages to the reader
- [x] Make an appropriate choice of categories in the front matter. The first category will be used in the breadcrumb for the page, others will generate the side menu
- [x] Use Emacs to generate the reading ease and grade level (this should happen automatically when saving the file in my Emacs configuration). These are just for fun, incidentally, and appear to have no impact on audience engagement
- [ ] Set the draft to false when you want to publish, then push to GitHub
- [ ] Drop a video announcing this post on Instagram etc, and post anywhere else you can as well. Reels and videos work better for engagement
- [ ] Consider what tomorrow's article will be, and try to post a new one once a day (more is fine)
{{</ md-comment >}}

Have you ever wanted to try [Dungeons and Dragons](https://en.wikipedia.org/wiki/Dungeons_%26_Dragons), but fear interaction with other people? If your answer is 'No,' then... well... fair enough.

As for all you 'Yes' people, let me tell you about solo RPGs. As the name would suggest, they're role playing games (like D&D), except you can play them without a Dungeon Master[^Dungeon Master]. To get around this lack of DM, most solo RPGs supply a strongly structured gameplay format and story prompts.

I've recently been enjoying a solo RPG called *[Thousand Year Old Vampire](https://timhutchings.itch.io/tyov)*, by [Tim Hutchings](https://thousandyearoldvampire.com/). In it, you take on the role of a recently sired vampire, and play out their life for the next several centuries. Since it's getting near Halloween and vampires are spooky, I thought I'd tell you all about it.

I was particularly drawn to *TYOV* because each prompt is resolved by writing out experiences. To me, that sounded like a very fun writing exercise! However, one does not just respond to prompts with abandon: you have to stick by the mechanics of the game, incorporating specific traits and instructions into your responses. Not only that, but you have to be somewhat strategic about your writing to get to the end of the game. If you're a fan of writing with the [Oulipo](https://en.wikipedia.org/wiki/Oulipo)[^Oulipo] method, then this game could be the perfect thing. It's definitely a unique and challenging way to flex those storytelling muscles.

Perhaps my favourite part of the game is how it forces you to manage memories. With your vampire being so old, you can only hold so many memories in your head at once, so some will have to be moved to a diary; but even that is limited. Eventually, you will need to choose which memories to hold onto, and which to cast aside forever. It's a beautifully dark reminder that our consequences will be remembered far longer than our actions. As such, we should be working toward the best future for all, and worry less about our personal legacies.

It really is a very good game, so please support Tim Hutchings and [buy a copy](https://timhutchings.itch.io/tyov). Although the physical edition is more expensive, it's so beautifully produced that I recommend it wholeheartedly. Having said that, the digital copy is a very faithful reproduction.

If your funds are especially low, you could even request a free community edition instead. Hats off to Tim for being so generous in offering these!

So, now that we've established what *TYOV* is and why I'm enjoying it so much, let's talk about an idea I had to make it easier to play.

The one issue I had when I first played was keeping a track of all the experiences, skills, resources, characters, and marks. This is especially tricky because things are constantly being checked, crossed out, lost, restored, forgotten, remembered, and moved around. Since the game comes as just a book, you have to supply the play medium for yourself. I was initially juggling bits of paper around, but found it complex enough that it was distracting me from the actual writing. I found it easier to use a text file on my computer, but that was still quite effortful.

And then it occurred to me that I should, of course, be playing it in my favourite format of all: Org Mode inside Emacs!

[I've written a little about Org Mode before](/tags/org-mode/), but the relevant parts to *TYOV* are these:

- Org Mode supports quickly hiding/restoring sections and subsections
- Org Mode allows headings to be marked in customised, dynamic ways
- Org Mode allows sections to be tagged
- Org Mode allows text to be scored out
- Org Mode allows the creation of check-mark lists
- Org Mode makes it incredibly fast to move sections, subsections, and list items around

With this vast power to hand, I went about creating a template file for playing *Thousand Year Old Vampire*, and in a moment of whimsy I titled it *Thousand Year* ***Org*** *Vampire*:

```orgmode {linenos=inline style=dracula}
#+TITLE: Thousand Year Org Vampire
#+TYP_TODO: MEMORY(m) DIARY(d) | FORGOTTEN(f)
#+TYP_TODO: ALIVE(a) | EXPIRED(e)
#+TAGS: { MORTAL(m)  IMMORTAL(i) }
#+PROPERTY: LOGGING nil

** Experiences


*** MEMORY Name of Memory One

**** 0.1: A short history of your character before becoming a vampire; how you feel about your life so far and what you hope for the future---any additional information you want to include.


*** MEMORY Name of Memory Two

**** 0.2: An experience from before you were a vampire combining two of your traits; how you felt about that experience and how it might affect you moving forward---any additional information you want to include.


*** MEMORY Name of Memory Three

**** 0.3: An experience from before you were a vampire combining two of your traits; how you felt about that experience and how it might affect you moving forward---any additional information you want to include.


*** MEMORY Name of Memory Four

**** 0.4: An experience from before you were a vampire combining two of your traits; how you felt about that experience and how it might affect you moving forward---any additional information you want to include.


*** MEMORY Name of Memory Five

**** 0.5: A description of how you were sired and marked; how you feel about your change and your sire---any additional information you want to include.



** Skills
- [ ] Name of Unchecked Skill
- [ ] Name of Unchecked Skill
- [ ] Name of Unchecked Skill
- [x] Name of Checked Skill
- [ ] +Name of Lost Skill+



** Resources
- Name of Resource---short description of resource
- Name of Resource---short description of resource
- Name of Resource---short description of resource
- +Name of Lost Resource---short description of resource+



** Characters


*** ALIVE First Mortal's Name                                     :MORTAL:
Description of first mortal.


*** ALIVE Second Mortal's Name                                    :MORTAL:
Description of second mortal.


*** ALIVE Third Mortal's Name                                     :MORTAL:
Description of third mortal.


*** ALIVE Name of Your Sire                                     :IMMORTAL:
Description of the creature that turned you into a vampire.


*** EXPIRED Name of mortal Character                              :MORTAL:
Description of mortal character.



** Marks
- Name of Mark---short description of mark
```

I should point out that it looks much prettier inside actual Emacs (as you can see from the banner image at the top of the page).

Although this file might not look like anything special, I could now do a lot of things very easily that weren't an option in a standard text file. For example:

- Cycle a **memory** marker between ***MEMORY***, ***DIARY***, and ***FORGOTTEN*** by holding down '`Control`' and hitting '`c`' then '`t`'
- Toggle a **character** heading marker between ***ALIVE*** and ***EXPIRED*** by holding down '`Control`' and hitting '`c`' then '`t`'
- Move **memories** and **experiences** (and **most other things**) around by holding down '`Alt`' and then using the `arrow keys`
- Check and un-check a **skill** by holding '`Control`' and hitting '`c`' twice
- Strike out a **resource** or **skill** by putting a '`+`' before and after the given text (and un-strike it by removing them)
- Tag a **character** as being (exclusively) ***MORTAL*** or ***IMMORTAL*** by holding down '`Control`' and hitting '`c`' then '`q`'

Additionally, Org Mode lets me write the experiences and descriptions with nice formatting options[^Org Mode Formatting]. It might seem like I've given myself a lot of key combinations to remember there, but notice that they generally start by holding down '`Control`' and hitting '`c`'. As such, all I really need to remember is '`t`' (*type* of thing), '`c`' (*check* a thing), and '`q`' (*quality* of a thing).

If you've played *TYOV* before, then there are two things to be aware: the first is that I number experiences according to the prompt, with the number after the decimal point indicating which variant of the prompt is being resolved; the second is that I found I could simply mark memories as being *diary* entries or *forgotten*, rather than explicitly moving them into 'Diary' or 'Forgotten' sections. Although I think both these decisions make the game much faster and simpler to manage, I mention them here because I feel they might be non-obvious at first.

At this point, I'd say I was already onto a definite win and had found a very convenient way to play *TYOV*. However, Org Mode is even more powerful than just this simple setup. Org Mode also allows us to do literate programming.

Literate programming was a concept conceived by one of the true giants of Computer Science, [Donald Knuth](https://en.wikipedia.org/wiki/Donald_Knuth). The idea was that you could write a computer program in the order that made the most sense when explaining it to a human, using lots of normal descriptive text. Then, when a computer needed to understand it, the code blocks inside the text would be stripped out, put back into the order the computer needed them in, then run as a program. While it never really took the world by storm, I've always rather enjoyed writing code this way. In any case, Org Mode supports literate programming, and in a rather more powerful form than Knuth originally conceived.

Org Mode's version of literate programming is called [Babel](https://orgmode.org/worg/org-contrib/babel/intro.html) and, unlike Knuth's original idea, it allows lots of different programming languages to work together in one file to solve the same problem. It also let's you run code and show the results within the same file. With this power available to me, I realised that I could not only use my Org file as a play space for *TYOV*: I could actually have the game logic coded into the file to keep track of the entire game for me. The only thing I'd have left to do would be looking up the prompt text from the book when my file told me which number was next.

The first thing I needed to do before actually coding anything was to declare some global variables. I moved all the existing stuff into a heading called *Play Space*, and then created a new heading called *Play Variables*. The program would need to track the current prompt, what prompts had already been used, and all the prompts available in the game. There are many ways to declare data in Org Mode, but I opted to use the global file method since these were 'global' variables:

```orgmode {linenos=inline style=dracula}
* Play Variables
#+CURRENT_PROMPT: 1.1
#+USED_PROMPTS: ()
#+ALL_PROMPTS: ()
```

The prompt-selection algorithm for a new game always calculates from prompt 1.1, and our used prompts will initially be an empty list (defined in our chosen programming language---Emacs LISP---by an opening and closing parenthesis).

Notice that the *ALL_PROMPTS* variable is also an empty list. This will need to be corrected. Entering a list of all the game's prompt numbers could be done manually, but I decided to generate this with code instead.

Just below these variables, I created the first code block in the file:

```emacs-lisp {linenos=inline style=dracula}
#+name: prompt-number-generator
#+begin_src emacs-lisp :tangle no :var main-prompts=71 prompt-variants=3 end-game-prompts=9 :results silent
  ;; This generates a list that can be used as the value for ALL_PROMPTS. It assumes that end-game-prompts have no variations and come after the main prompts.
  (let ((x 1)
        (y 1)
        (z 1)
        (prompt-list "("))
    (while (< x (1+ main-prompts))
      (while (< y (1+ prompt-variants))
        (setq prompt-list (concat prompt-list (format "%d.%d " x y)))
        (setq y (1+ y)))
      (setq y 1)
      (setq x (1+ x)))
    (while (< z (1+ end-game-prompts))
      (setq prompt-list (concat prompt-list (format "%d.1 " (+ main-prompts z))))
      (setq z (1+ z)))
    (setq prompt-list (concat (string-trim-right prompt-list " ") ")"))
    (when (derived-mode-p 'org-mode)
      (save-excursion
        (let ((regexp (format "^[ \t]*#\\+%s:" (regexp-quote "ALL_PROMPTS")))
              (case-fold-search t))
          (goto-char (point-min))
          (if (re-search-forward regexp nil t)
              (progn
                (insert " ")
                (delete-region (point) (line-end-position))
                (insert (format "%s" prompt-list)))))))
    (print prompt-list))
#+end_src
```

I don't want this to turn into a beginner's guide to programming, but hopefully I'll explain enough that you can roughly understand what everything is doing. Mostly, I'll concentrate on the literate programming, as I hope that will be interesting to coders and non-coders alike.

As seen above, the first line gives this code block a name. Having a name means that it can be called from (and included inside) other code blocks. The next line is the actual code block declaration for Org Mode. It tells Emacs that this code block will use the Emacs LISP programming language, and that Emacs should not try to create a dedicated computer source file from this code block (called *tangling* in literate programming jargon). It also has a declaration of variables for the code block with their default values, and then a directive to Emacs not to produce a results block for the output of this code. After that, everything until `#+end_src` is Emacs LISP code.

You can see from the variables that the *TYOV* book has 71 main prompts (each with three variations), and that there are 9 game-ending prompts. I've also added a comment that I'm assuming game-ending prompts have no variations and come after the main prompts in the book. This means that if I wanted to play another game that used the same rules as *TYOV*, and laid out it's prompts in a similar fashion (perhaps *[Tales from the Gods](https://www.drivethrurpg.com/en/product/453826/tales-from-the-gods)* by Axo Stories), I could simply change these three variables and run the code again to get the correct result. The code generates all the correct prompt numbers as a list, then updates *ALL_PROMPTS* to the correct value. We can run this code block by placing the cursor anywhere inside it, holding down '`Control`' and hitting '`c`' twice. We are now left with these global variables:

```orgmode {linenos=inline style=dracula}
* Play Variables
#+CURRENT_PROMPT: 1.1
#+USED_PROMPTS: ()
#+ALL_PROMPTS: (1.1 1.2 1.3 2.1 2.2 2.3 3.1 3.2 3.3 4.1 4.2 4.3 5.1 5.2 5.3 6.1 6.2 6.3 7.1 7.2 7.3 8.1 8.2 8.3 9.1 9.2 9.3 10.1 10.2 10.3 11.1 11.2 11.3 12.1 12.2 12.3 13.1 13.2 13.3 14.1 14.2 14.3 15.1 15.2 15.3 16.1 16.2 16.3 17.1 17.2 17.3 18.1 18.2 18.3 19.1 19.2 19.3 20.1 20.2 20.3 21.1 21.2 21.3 22.1 22.2 22.3 23.1 23.2 23.3 24.1 24.2 24.3 25.1 25.2 25.3 26.1 26.2 26.3 27.1 27.2 27.3 28.1 28.2 28.3 29.1 29.2 29.3 30.1 30.2 30.3 31.1 31.2 31.3 32.1 32.2 32.3 33.1 33.2 33.3 34.1 34.2 34.3 35.1 35.2 35.3 36.1 36.2 36.3 37.1 37.2 37.3 38.1 38.2 38.3 39.1 39.2 39.3 40.1 40.2 40.3 41.1 41.2 41.3 42.1 42.2 42.3 43.1 43.2 43.3 44.1 44.2 44.3 45.1 45.2 45.3 46.1 46.2 46.3 47.1 47.2 47.3 48.1 48.2 48.3 49.1 49.2 49.3 50.1 50.2 50.3 51.1 51.2 51.3 52.1 52.2 52.3 53.1 53.2 53.3 54.1 54.2 54.3 55.1 55.2 55.3 56.1 56.2 56.3 57.1 57.2 57.3 58.1 58.2 58.3 59.1 59.2 59.3 60.1 60.2 60.3 61.1 61.2 61.3 62.1 62.2 62.3 63.1 63.2 63.3 64.1 64.2 64.3 65.1 65.2 65.3 66.1 66.2 66.3 67.1 67.2 67.3 68.1 68.2 68.3 69.1 69.2 69.3 70.1 70.2 70.3 71.1 71.2 71.3 72.1 73.1 74.1 75.1 76.1 77.1 78.1 79.1 80.1)
```

With our global variables in place, we can now move onto some other house keeping code.

For one thing, I'd like to be able to reset the play space quickly. The simplest way to do this would be deleting the *Play Space* section and replacing it with the default text again. This is trivial to do. Under a new heading called *Gameplay Functions*, we can put the following code block:

```emacs-lisp {linenos=inline style=dracula}
#+name: reset-playspace
#+begin_src emacs-lisp :tangle no :results silent
  (when (derived-mode-p 'org-mode)
    (save-excursion
      (let ((regexp (format "^%s" (regexp-quote "* Play Space")))
            (case-fold-search t))
        (goto-char (point-min))
        (when (re-search-forward regexp nil t)
          (org-cut-subtree))
        (delete-trailing-whitespace)
        (insert "* Play Space\n"
                "** Experiences\n"
                "*** MEMORY Name of Memory One\n"
                "**** 0.1: A short history of your character before becoming a vampire; how you feel about your life so far and what you hope for the future---any additional information you want to include.\n"
                "*** MEMORY Name of Memory Two\n"
                "**** 0.2: An experience from before you were a vampire combining two of your traits; how you felt about that experience and how it might affect you moving forward---any additional information you want to include.\n"
                "*** MEMORY Name of Memory Three\n"
                "**** 0.3: An experience from before you were a vampire combining two of your traits; how you felt about that experience and how it might affect you moving forward---any additional information you want to include.\n"
                "*** MEMORY Name of Memory Four\n"
                "**** 0.4: An experience from before you were a vampire combining two of your traits; how you felt about that experience and how it might affect you moving forward---any additional information you want to include.\n"
                "*** MEMORY Name of Memory Five\n"
                "**** 0.5: A description of how you were sired and marked; how you feel about your change and your sire---any additional information you want to include.\n"
                "** Skills\n"
                "- [ ] Name of Unchecked Skill\n"
                "- [ ] Name of Unchecked Skill\n"
                "- [ ] Name of Unchecked Skill\n"
                "- [x] Name of Checked Skill\n"
                "- [ ] +Name of Lost Skill+\n"
                "** Resources\n"
                "- Name of Resource---short description of resource\n"
                "- Name of Resource---short description of resource\n"
                "- Name of Resource---short description of resource\n"
                "- +Name of Lost Resource---short description of resource+\n"
                "** Characters\n"
                "*** ALIVE First Mortal's Name                                     :MORTAL:\n"
                "Description of first mortal.\n"
                "*** ALIVE Second Mortal's Name                                    :MORTAL:\n"
                "Description of second mortal.\n"
                "*** ALIVE Third Mortal's Name                                     :MORTAL:\n"
                "Description of third mortal.\n"
                "*** ALIVE Name of Your Sire                                     :IMMORTAL:\n"
                "Description of the creature that turned you into a vampire.\n"
                "*** EXPIRED Name of mortal Character                              :MORTAL:\n"
                "Description of mortal character.\n"
                "** Marks\n"
                "- Name of Mark---short description of mark\n"))))
#+end_src
```

As with our previous code block, we don't want this code tangled, or to produce a results block. Unlike our previous code, this one doesn't need any variables. Just for safety, it also checks to make sure the current file is an Org file, and it will try to return the cursor to the position it was in before the code block was run (that's what the `save-excursion` bit does).

Excellent. Though I suppose it's just as likely (perhaps more likely) that I'd want to reset the game entirely, and not just the play space. This would mean resetting the current prompt and used prompts back to their starting values. Rather than duplicate the code we've already written, we can use a literate programming style called *noweb*. *Noweb* allows us to use other code blocks from within a new code block. So, for example, if we wanted a code block to reset the game, we could create something like this:

```emacs-lisp {linenos=inline style=dracula}
#+name: reset-game
#+begin_src emacs-lisp :tangle no :noweb yes :results silent
  <<restart-game>>
  <<reset-playspace>>
#+end_src
```

Again, I've declared that I don't want this code tangled, or for it to produce a results block, but I've also added that it should be interpreted in the *noweb* style. The *noweb* commands can be seen enclosed in "`<< >>`" brackets. When this is seen, Emacs knows to copy the code from another block with the referenced name. So, here, it will copy the code from the code blocks named *restart-game* (which we haven't written yet) and *reset-playspace* (which we just coded up).

This is a rather nice way of developing code in a divide-and-conquer approach, where we can keep splitting the code into smaller and easier problems to solve. Since we already have *reset-playspace*, we should probably code up *restart-game*:

```emacs-lisp {linenos=inline style=dracula}
#+name: restart-game
#+begin_src emacs-lisp :tangle no :noweb yes :results silent
  <<reset-used-prompts>>
  <<reset-current-prompt>>
#+end_src
```

Again, we've split up the task into two smaller tasks that will be easier to code. I've chosen self-explanatory names, so lets start by coding up *reset-current-prompt*:

```emacs-lisp {linenos=inline style=dracula}
#+name: reset-current-prompt
#+begin_src emacs-lisp :tangle no :noweb yes :results silent
  <<set-current-prompt>>
  (set-current-prompt 1.1)
#+end_src
```

Now, thinking ahead a little here, I'm pretty sure that there will be other occasions in this file where I will want to set the current prompt to something specific. Therefore, I'll probably want to create a function that does that, then call that function here. I'll make sure the function exists in a code block called *set-current-prompt* and then call it right afterwards with standard Emacs LISP code to make it the starting value of 1.1.

Isn't this a delightful way to code up our ideas? We take a top down approach, and code as we go, trusting that the finer details will be dealt with later when we get around to it.

At this point, I'd say we're leaving the realm of code blocks that the user will call directly. Therefore, let's put theses machine-called functions somewhere else. I've chosen to put them under a heading called *Worker Functions* so that they'll be kept out of the way when I'm playing the game. Before we leave to look at those functions, there really is only one other house keeping function that I think the user might run, so let's quickly add that in now:

```emacs-lisp {linenos=inline style=dracula}
#+name: reset-used-prompts
#+begin_src emacs-lisp :tangle no :noweb yes :results silent
  <<set-used-prompts>>
  (set-used-prompts "()")
#+end_src
```

As you can see, this takes a similar approach to *reset-current-prompt*. For the moment, we can leave the *Gameplay Functions* section and begin looking at the *Worker Functions*. Let's start with *set-current-prompt*:

```emacs-lisp {linenos=inline style=dracula hl_Lines="14-15"}
#+name: set-current-prompt
#+begin_src emacs-lisp :tangle no :var new-val=1.1 :results silent
  (defun set-current-prompt (val)
    (when (derived-mode-p 'org-mode)
      (save-excursion
        (let ((regexp (format "^[ \t]*#\\+%s:" (regexp-quote "CURRENT_PROMPT")))
              (case-fold-search t))
          (goto-char (point-min))
          (if (re-search-forward regexp nil t)
              (progn
                (insert " ")
                (delete-region (point) (line-end-position))
                (insert (number-to-string val))))))))
  (when (boundp 'new-val)
    (set-current-prompt new-val))
#+end_src
```

We've created a variable with a default value so that we can run this code block directly to reset the current prompt. However, if it is called from elsewhere, we would have the option to override this variable. In the *noweb* style, we can do more than copy code blocks into each other: we can also run the code and just copy the result. So, for instance, instead of using `<<set-current-prompt>>`, we could have used `<<set-current-prompt()>>` to get the result instead of the code. This would have used the default values for all the variables, but we could also override those by using `<<set-current-prompt(new-val=3.2))>>` (or whatever we wanted new-val to equal).

In this code block, I have defined a function that can be used in other parts of our Emacs LISP code. Of course, we can call code blocks as many times as we want using the *noweb* style, and I've just demonstrated that we can call it with different variable values each time... so why code up Emacs LISP functions as well?

Functionally, there is no strong reason to use one method over the other; I just felt it was the right thing to do in this case because it keeps things more versatile for potential future use. In order to keep both options open to me, I have to actually run the function within the code block. The last two lines (highlighted above) show how I do this by checking if the `new-val` variable has a value. If it does, I run the function using that value. If `new-val` doesn't have a value (which it won't if we're just copying the code block using `<<set-current-prompt>>`), then it won't do anything. This means we can now use this code in three ways:

- We can run the code block here and it will work with the default value.
- We can call it using `<<set-current-prompt()>>` and `<<set-current-prompt(new-val=1.1)>>` and it will work with the default value or a given value.
- We can call it the way we actually have: by first copying the code with *noweb* and then calling the function ourselves with `(set-current-prompt 1.1)`.

Again, I just think the versatility and power of literate programming in Org mode is astonishing. And keep in mind that we aren't restricted to doing this all in one programming language. All these things would still work perfectly if we were using multiple programming languages, where each one was better at solving a particular part of the puzzle. In the case of this little project, that's not really necessary, but it's cool to have the option.

The code block for *set-used-prompts* is very similar in concept:

```emacs-lisp {linenos=inline style=dracula}
#+name: set-used-prompts
#+begin_src emacs-lisp :tangle no :var new-val-list="()" :results silent
  (defun set-used-prompts (val-list)
    (when (derived-mode-p 'org-mode)
      (save-excursion
        (let ((regexp (format "^[ \t]*#\\+%s:" (regexp-quote "USED_PROMPTS")))
              (case-fold-search t))
          (goto-char (point-min))
          (if (re-search-forward regexp nil t)
              (progn
                (insert " ")
                (delete-region (point) (line-end-position))
                (insert (format "%s" val-list))))))))
  (when (boundp 'new-val-list)
    (set-used-prompts new-val-list))
#+end_src
```

At this point, we've achieved all the house keeping code. We can now completely restart a game, resetting all the variables and the play space by just running one code block (which in turn runs all the others), but we've also given ourselves the option of running individual parts of the whole. Great!

However, without the file actually taking care of the prompt management for us, that's all a little moot, so we better get onto that next.

From my perspective while playing the game, I really only want the file to tell me one thing: what is the next prompt? So, let's start with that in the *Gameplay Functions* section:

```emacs-lisp {linenos=inline style=dracula}
#+name: get-next-prompt
#+begin_src emacs-lisp :tangle no :noweb yes :var lowest-prompt=get-lowest-prompt() highest-prompt=get-highest-prompt() curr-prompt=get-current-prompt() all-prompts=get-all-prompts() used-prompts=get-used-prompts() move-by=move-amount()
  (let ((new-prompt (max lowest-prompt (+ (+ 0.1 (ffloor curr-prompt)) move-by))))
    <<set-current-prompt>>
    <<set-used-prompts>>
    (catch 'prompt-found
      (while (or (not (member new-prompt all-prompts)) (member new-prompt used-prompts))
        (when (> new-prompt highest-prompt)
          (setq new-prompt highest-prompt)
          (throw 'prompt-found t))
        (setq new-prompt (/ (+ 1 (ffloor (* 10 new-prompt))) 10))))  ; Floating point addition not reliable, so using integer addition. This does restrict to 9 variants
    (set-current-prompt new-prompt)
    (set-used-prompts (sort (add-to-list 'used-prompts new-prompt) '<))
    (message "%s" (number-to-string new-prompt)))
#+end_src
```

Gosh, that code block declaration line looks a tad more complicated than our previous ones, doesn't it? Really though, there are only two major differences from our previous ones: the first is that I'm not suppressing the generation of a results block (in this case, we'll want one to show us the next prompt number); and the second is that the variables are being set by other code blocks rather than by hand. And, like earlier, we haven't written any of those code blocks yet.

All the same, let us assume that we will eventually write those code blocks and that they will give us the correct information to populate these variables. The rest of the code is then using these variables to apply the rules of the game about which prompt we need to resolve next. The `move-by` amount is determined by rolling dice (which we'll fake in software later on) and says how many prompts we need to move by, and in which direction. We then add that to the current prompt number, and check that we've not gone lower than the lowest prompt number available.

We're still not done though, because it's possible the new prompt doesn't exist, or that we've resolved it before. Therefore, we need to check against the list of all prompts, and the list of prompts used so far. If we have used a prompt before, then we can see if we have tried all variants of that prompt. If we have, then we just go one prompt up and do all the checks again.

One last thing to watch for is that we've not gone higher than the last prompt. If so, we just resolve the last prompt. Since the last prompt is a game-ending prompt, doing this should not mean that we are repeating it.

You might also have noticed the *noweb* code blocks. Those give us access to two functions we've already written that allow us to update the values of the current prompt and the used prompts.

The last thing we do is send a message to the user about which prompt is next. Because this is the last thing evaluated in the code block, this will also form the results block for us to look at again whenever we need to.

If you followed all that, well done! That is probably the most complicated bit of logic in the whole file. The rest is just coding up the variable-setting code blocks (which are all quite straightforward). Let's take a look at *get-lowest-prompt* to start off with (and let's put that in the *Worker Functions* section):

```emacs-lisp {linenos=inline style=dracula}
#+name: get-lowest-prompt
#+begin_src emacs-lisp :tangle no :results silent
  (when (derived-mode-p 'org-mode)
    (save-excursion
      (let ((regexp (format "^[ \t]*#\\+%s:" (regexp-quote "ALL_PROMPTS")))
            (case-fold-search t))
        (goto-char (point-min))
        (if (re-search-forward regexp nil t)
            (apply 'min (read (buffer-substring (point) (line-end-position))))
          (eval nil)))))
#+end_src
```

All this is doing is reading in the list for *ALL_PROMPTS*, then applying a 'minimum' function to it to find the lowest one. The code blocks for *get-highest-prompt*, *get-current-prompt*, *get-all-prompts*, and *get-used-prompts* are all very similar, so I'll put them all here at once and not bother explaining them in more detail:

```emacs-lisp {linenos=inline style=dracula}
#+name: get-highest-prompt
#+begin_src emacs-lisp :tangle no :results silent
  (when (derived-mode-p 'org-mode)
    (save-excursion
      (let ((regexp (format "^[ \t]*#\\+%s:" (regexp-quote "ALL_PROMPTS")))
            (case-fold-search t))
        (goto-char (point-min))
        (if (re-search-forward regexp nil t)
            (apply 'max (read (buffer-substring (point) (line-end-position))))
          (eval nil)))))
#+end_src

#+name: get-current-prompt
#+begin_src emacs-lisp :tangle no :results silent
  (when (derived-mode-p 'org-mode)
    (save-excursion
      (let ((regexp (format "^[ \t]*#\\+%s:" (regexp-quote "CURRENT_PROMPT")))
            (case-fold-search t))
        (goto-char (point-min))
        (if (re-search-forward regexp nil t)
            (string-to-number (buffer-substring (point) (line-end-position)))
          (eval nil)))))
#+end_src

#+name: get-all-prompts
#+begin_src emacs-lisp :tangle no :results silent
  (when (derived-mode-p 'org-mode)
    (save-excursion
      (let ((regexp (format "^[ \t]*#\\+%s:" (regexp-quote "ALL_PROMPTS")))
            (case-fold-search t))
        (goto-char (point-min))
        (if (re-search-forward regexp nil t)
            (read (buffer-substring (point) (line-end-position)))
          (eval '())))))
#+end_src

#+name: get-used-prompts
#+begin_src emacs-lisp :tangle no :results silent
  (when (derived-mode-p 'org-mode)
    (save-excursion
      (let ((regexp (format "^[ \t]*#\\+%s:" (regexp-quote "USED_PROMPTS")))
            (case-fold-search t))
        (goto-char (point-min))
        (if (re-search-forward regexp nil t)
            (read (buffer-substring (point) (line-end-position)))
          (eval '())))))
#+end_src
```

Believe it or not, we only have one thing left to do: fake some dice. Our *get-next-prompt* code block has a variable called *move-by* which is derived by the (currently non-existent) code block called *move-amount*. Let's create that code block now in *Worker Functions*:

```emacs-lisp {linenos=inline style=dracula}
#+name: move-amount
#+begin_src emacs-lisp :tangle no :var d20=simple-dice-simulator(die-type=20) :var d6=simple-dice-simulator(die-type=6) :results silent
  (- d20 d6)
#+end_src
```

As you can see, it just sets up two variables using another code block (which we're about to create) called simple-dice-simulator. That code block will take a variable indicating how many sides we want our die to have, then 'roll' it and tell us the result. *TYOV* calls for a move to be defined by rolling a six-sided die, then taking that value away from the roll of a twenty-sided die. The result is the amount of prompts we need to move by (if the number is negative, then we move backwards). This demonstrates that not only can we set variables in code blocks by using other ones, but that additional information can be passed to those code blocks too. In this case, *simple-dice-simulator* is being used to produce both variables, but each time it is called with a different value for the type of die. Let's code up *simple-dice-simulator now* in *Worker Functions*:

```emacs-lisp {linenos=inline style=dracula}
#+name: simple-dice-simulator
#+begin_src emacs-lisp :tangle no :var die-type=20 :results silent
  (random die-type)
#+end_src
```

The *random* function is built into Emacs LISP and will simply generate a random integer between 0 and the integer given. In this case, that will be the variable for die-type, which we used twice in the *move-amount* code block. Pretty simple[^Randomness].

And there we have it. If you put your cursor into the *get-next-prompt* function and hold down '`Control`' while hitting '`c`' twice, you should get a result telling you the next prompt that you need to look up in the book. Awesome!

So now, let's just take a step back and realise what we've achieved here:

We have a single text file. That text file uses a mark-up system called Org Mode, which Emacs can understand. If we open this file in Emacs, it gives us access to manipulate the text in such a way that playing *Thousand Year Old Vampire* becomes a lot easier and more fun. And, even more clever, it has computer code embedded in the very same text file that can manage the prompts for us, remembering which ones we've done and telling us which ones to do next. It even has the power to do some house keeping tasks, like resetting the play space, and restarting the game.

I don't know about you, but I think that's pretty amazing and cool. Just one more reason why I love coding, and why I love Emacs.

{{< md-comment >}}
Getting Hugo to acknowledge an Org file as a downloadable file (rather than a source file to be rendered) is a bit tricky. I couldn't find a way to force a leaf bundle to include an explicit static version of an Org file, so I instead copied it into the global static directory, with sub-folders to match the layout of this markdown file. This is a disappointing solution as it means that this leaf bundle is not portable. This is the second time so far that I've had to resort to such non-portable tactics (the other time revolving around JavaScript code specific to a leaf bundle that I resolved by creating new short codes). For the moment, at least, I have yet to come up with better solutions to such problems (although setting unsafe options in Goldmark settings would have allowed me to call JavaScript directly from within the markdown I suppose).
{{</ md-comment >}}

If you want to make life easier on yourself and just get a completed Org file that does everything this tutorial covered (and even includes some instructions for how to use it), then feel free to download [the complete, finished tutorial file for *Thousand Year Org Vampire*](ThousandYearOrgVampire.org)[^TYOV.org]. It should work fine in all recent versions of Emacs.

As a little homework assignment for those of you who have bought the game, you might like to code the prompt text into the system as well. I've done this with my own (private) copy of *Thousand Year Org Vampire*, and it means that I can play the game entirely within Emacs. No book, dice, or pen-and-paper needed. What a time to be alive!

Naturally, I'm not going to be releasing that file because it would breach copyright. Also, I just really want you to buy a copy of the game from Tim Hutchings. He deserves it for all his hard work in making such a cool game.

I hope you've enjoyed this tutorial on literate programming, and about playing *TYOV* in Emacs. May you create your greatest vampiric tomorrow by living your best foreboding today. Happy Halloween, everyone!

## Footnotes
[^Dungeon Master]: A Dungeon Master is the person who would normally tell you what was happening in your game world.
[^Oulipo]: Short for Ouvroir de littérature potentielle (Workshop of Potential Literature). It was originally a collective of French writers and mathematicians who put playful, artificial constraints on their creative efforts in order to produce more unique works.
[^Org Mode Formatting]: [The official Org Mode site](https://orgmode.org/) has an overview of text formatting options and other information about Org Mode.
[^Randomness]: As a side note, this random function is probably a little less random than we might hope and is technically a pseudorandom number generator. Getting truly random numbers from a program is actually a [surprisingly complex topic](https://en.wikipedia.org/wiki/Random_number_generation), but it would be overkill to worry about that for this particular application.
[^TYOV.org]: Download the completed file: [ThousandYearOrgVampire.org](ThousandYearOrgVampire.org)
