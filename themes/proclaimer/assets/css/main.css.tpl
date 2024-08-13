/* Store site colours here as variables, as well as complex shadows
   to maintain look across site. */
:root {
  --logo-high: {{ site.Params.colors.logoHigh | default "#15C5FE" }};
  --logo-low: {{ site.Params.colors.logoLow | default "#A100FA" }};
  --site-background: {{ site.Params.colors.siteBackground | default "#FFFFFF" }};
  --nav-a: {{ site.Params.colors.navA | default "#7C8C8C" }};
  --nav-a-active: {{ site.Params.colors.navAActive | default "#0B0D0C" }};
  --nav-a-hover: {{ site.Params.colors.navAHover | default "#5C6C6C" }};
  --a: {{ site.Params.colors.a | default "#0B0D0C" }};
  --a-active: {{ site.Params.colors.aActive | default "#5C6C6C" }};
  --a-hover: {{ site.Params.colors.aHover | default "#5C6C6C" }};
  --body-text: {{ site.Params.colors.bodyText | default "#7C8C8C" }};
  --h1: {{ site.Params.colors.h1 | default "#5C6C6C" }};
  --summary: {{ site.Params.colors.summary | default "#5C6C6C" }};
  --shadow-color: 0deg 0% 63%;
  --shadow-elevation-low:
    0.3px 0.5px 0.9px hsl(var(--shadow-color) / 0),
    0.6px 1.1px 1.9px hsl(var(--shadow-color) / 0.35),
    1.3px 2.5px 4.2px hsl(var(--shadow-color) / 0.69);
  --shadow-elevation-medium:
    0.3px 0.5px 0.8px hsl(var(--shadow-color) / 0.23),
    1.1px 2.2px 3.2px -0.4px hsl(var(--shadow-color) / 0.34),
    2.5px 5px 7.3px -0.8px hsl(var(--shadow-color) / 0.45),
    5.6px 11.3px 16.6px -1.2px hsl(var(--shadow-color) / 0.57);
  --shadow-elevation-high:
    0.3px 0.5px 0.7px hsl(var(--shadow-color) / 0.34),
    1.5px 2.9px 3.7px -0.4px hsl(var(--shadow-color) / 0.34),
    2.7px 5.4px 6.8px -0.7px hsl(var(--shadow-color) / 0.34),
    4.5px 8.9px 11.2px -1.1px hsl(var(--shadow-color) / 0.34),
    7.1px 14.3px 18px -1.4px hsl(var(--shadow-color) / 0.34),
    11.2px 22.3px 28.1px -1.8px hsl(var(--shadow-color) / 0.34),
    17px 33.9px 42.7px -2.1px hsl(var(--shadow-color) / 0.34),
    25px 50px 62.9px -2.5px hsl(var(--shadow-color) / 0.34);
  --input-border: var(--logo-high);
  --input-focus: var(--logo-low);
    }



/* Use border-box everywhere for box-sizing. */
*,
*::before,
*::after {
    box-sizing: border-box;
}



/* General tag styling. */
body {
    color: var(--body-text);
    background-color: var(--site-background);
    font-family: "Noto Sans", sans-serif;
    font-optical-sizing: auto;
    font-weight: 400;
    font-style: normal;
    font-variation-settings: "wdth" 100;
    line-height: 1.5;
    margin: 0em;
}

header {
    margin-bottom: 8rem;
    background-color: var(--site-background);
}

footer {
    padding-top:2px;  /* Needed to allow background gradient to be visible */
    background:
        linear-gradient(
            to left,
            var(--logo-high) 0%,
            var(--logo-low) 100%
        )
        left
        top
        var(--site-background)
        no-repeat;
    background-size: 100% 2px;  /* Resize needed when using linear-gradient for background */
    margin-top: 1rem;
}

/* This is used to check if CSS is disbled by applying it to an empty div tag. */
#css-tester {
    width: 3px;
}

h1, h2, h3, h4, h5, h6 {
    font-weight: 800;
    color: var(--h1);
    text-transform: uppercase;
    margin-top: 2.5rem;
    margin-bottom: 0;
}

h1 {
    margin-top: 1rem;
    font-size: 2rem;
}

h2 {
    font-size: 1.5rem;
}

h3 {
    font-size: 1.4rem;
    font-style: italic;
}

h4 {
    font-size: 1.1rem;
}

h5 {
    font-size: 1rem;
    font-style: italic;
}

h6 {
    font-size: 0.8rem;
}

ul {
    margin-top: 0;
}

.hidden {
    display: none;
}

.lowercase {
    text-transform: lowercase;
}



/* Top nav styling. */

button {
    display: inline-block;
    border: none;
    padding: 0;
    margin: 0;
    text-decoration: none;
    background: transparent;
    color: transparent;
    font-family: inherit;
    font-size: 0;
    line-height: 0;
    cursor: pointer;
    text-align: center;
    transition: background 250ms ease-in-out, transform 150ms ease;
    -webkit-appearance: none;
    -moz-appearance: none;
}

button:hover,
button:focus {
    background: transparent;
}

button:focus {
    outline: 0;
    outline-offset: 0;
}

button:active {
    transform: scale(1);
}

#hamburger-menu {
    display: flex;
    flex-direction: row;
    justify-content: flex-start;
    align-items: center;
    margin-left: 10px;
    margin-top: 0;
}

#hamburger-menu svg {
    width: 40px;
    height: 40px;
}

.menu-close-icon-container {
    width: 40px;
    height: 40px;
    margin-top: 10px;
    margin-left: 5px;
}

.menu-close-icon-container svg {
    width: 40px;
    height: 40px;
}

.menu-riser {
    animation: glideUp 0.3s ease-out forwards;
}

@keyframes glideUp {
        0% {
            border-color: var(--logo-high);
            box-shadow: var(--shadow-elevation-medium);
        }
  100% {
      border-color: var(--logo-low);
      box-shadow: var(--shadow-elevation-high);
  }
}

.top-search {
    align-items: center;
    display: flex;
    justify-content: flex-end;
    margin-left: auto;
    padding-right: 20px;
}

.FadeOut {
    animation: fadeDown 0.1s linear forwards;
}

@keyframes fadeDown {
 0% { opacity:1; }
 100% { opacity:0; }
}

.FadeIn {
    animation: fadeUp 0.1s linear forwards;
}

@keyframes fadeUp {
 0% { opacity:0; }
 100% { opacity:1; }
}

#search-bar-container {
    position: absolute;
    top: 23px;
    right: 20px;
}

.search-loading {
    margin-top: 2rem;
}

.search-icon-container {
    width: 40px;
    height: 40px;
}

/* This adds a little colour transition, and shadow animation after the search box appears. */
#search-query {
    transition: 1s;
}

.searchbar {
    font-size: 16px;
    font-size: max(16px, 1em);
    font-family: inherit;
    padding: 0.25em 0.5em;
    background-color: var(--site-background);
    border: 2px solid var(--input-border);
    border-radius: 4px;
    box-shadow: var(--shadow-elevation-medium);
    outline: 3px solid transparent;
}

.searchbar:not(textarea) {
    line-height: 1;
    height: 2.25rem;
    outline: 3px solid transparent;
}

.searchbar {
    transition: 0.2s;
}

.searchbar:focus {
    border-color: var(--input-focus);
    box-shadow: var(--shadow-elevation-high);
    outline: 3px solid transparent;
}

.top-search svg {
    width: 40px;
    height: 40px;
}

.homelink {
    display: flex;
    width: auto;
    align-items: center;
    text-transform: uppercase;
    font-size: 1.3rem;
    font-weight: 800;
    color: var(--a);
    padding-right: 0;
    margin: 10px 0 10px 0;
}

.topnav stop {
    transition: 0.2s;
}

.topnav svg stop:first-child {
    stop-color: var(--logo-high);
}

.topnav svg:hover stop:first-child {
    stop-color: var(--logo-low);
}

.topnav svg stop:last-child {
    stop-color: var(--logo-low);
}

.topnav svg:hover stop:last-child {
    stop-color: var(--logo-high);
}

.logorollover svg {
  margin-bottom: -6px;
  height: {{ site.Params.logo.height | default "60" }};
  width: {{ site.Params.logo.width | default "60" }};
  }.topnav ul {
    padding: 0;
    margin: 10px 1rem 10px 1rem;
}

.topnav a {
    text-decoration: none;
    color: var(--nav-a);
    padding-left: 0;
    background-image: none;
    background-color: var(--site-background);
    background-size: 100% 100%;
}

.topnav a:hover {
    text-decoration: none;
    color: var(--nav-a-hover);
    padding-left: 0;
    background-image: none;
    background-color: var(--site-background);
    background-size: 100% 100%;
}

.topnav a:active {
    color: var(--nav-a-active);
}

.topnav a.active {
    color: var(--nav-a-active);
}

.topnav-centered {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    margin-left: auto;
}

#side-menu {
    position: fixed;
    z-index: 100;
    opacity: 0;
    top: 5px;
    left: 5px;
    font-size: 16px;
    font-size: max(16px, 1em);
    font-family: inherit;
    padding: 0.25em 0.5em;
    background-color: var(--site-background);
    border: 2px solid var(--logo-high);
    border-radius: 4px;
    box-shadow: var(--shadow-elevation-medium);
    outline: 3px solid transparent;
}

.side-menu-sections {
    list-style: none;
    text-transform: uppercase;
    font-size: 1.3rem;
    font-weight: 800;
}

.side-menu-sections li {
    margin-top: 20px;
}

.side-menu-sections .side-menu-categories {
    list-style: none;
    text-transform: lowercase;
    font-size: 1.6rem;
    font-weight: 300;
    margin: 0 16px 0 16px;
}

.side-menu-categories li {
    margin-top: 0;
}

#side-menu-contents {
    overflow-y: auto;
    max-height: 60vh;
}



/* Single page styling */
article {
    display: block;
    max-width: 962px; /*1060px;*/
    margin-left: auto;
    margin-right: auto;
}

.breadcrumbs {
    font-size: 0.8rem;
    font-weight: 400;
}

.summary {
    color: var(--summary);
    margin-top: 0;
    margin-bottom: 30px;
    font-size: 1.1rem;
    font-weight: 600;
}

.entry-info {
    display: flex;
    justify-content: flex-start;
    align-contents: left;
    font-size: 0.8rem;
    font-weight: 400;
}

.reading-sizes {
    margin-left: 30px;
}

.reading-difficulty {
    margin-left: 30px;
}

.sharing-links a {
    text-decoration: none;
    padding-left: 0;
    background-image: none;
    background-color: var(--site-background);
    background-size: 100% 100%;
    color: var(--a);
    font-size: 0.8rem;
    font-weight: 400;
}

.sharing-links a:hover {
    color: var(--a-hover);
}

.sharing-links li {
    margin-top: 10px;
    margin-right: 10px;
}

.sharing-links li:last-child {
    margin-right: 0;
}

.banner-image img {
    transition: 0.5s;
}

.banner-image {
    max-width: 100%;
    height: auto;
    margin-left: auto;
    margin-right: auto;
}

.banner-image img {
    max-width: 100%;
    height: auto;
    margin-left: auto;
    margin-right: auto;
    box-shadow: var(--shadow-elevation-low);
}

.banner-image a {
    text-decoration: none;
    padding-left: 0;
    background-image: none;
    background-color: var(--site-background);
    background-size: 100% 100%;
}

.banner-image a:hover {
    color: var(--nav-a-hover);
    padding-left: 0;
    background-image: none;
    background-color: var(--site-background);
    background-size: 100% 100%;
}

.banner-image img:hover {
    box-shadow: var(--shadow-elevation-medium);
}

main {
    padding: 2rem;
    padding-top: 0;
}

.single-page-container {
    max-width: 1536px;
    display: flex;
    justify-content: center;
    flex-flow: row wrap;
    margin: auto;
}

img {
    max-width: 100%;
    height: auto;
    margin-left: auto;
    margin-right: auto;
    margin-top: 1.5rem;
    margin-bottom: 1.5rem;
}

figure img {
    transition: 0.5s;
}

figure {
    max-width: 100%;
    height: auto;
    margin-left: auto;
    margin-right: auto;
    margin-top: 1.5rem;
    margin-bottom: 1.5rem;
}

figure img {
    max-width: 100%;
    height: auto;
    display: block;
    margin-left: auto;
    margin-right: auto;
    box-shadow: var(--shadow-elevation-low);
}

figure figcaption {
    text-align: center;
    font-size: 0.8rem;
    font-weight: 400;
    margin-top: 0.5rem;
}

figure a {
    text-decoration: none;
    padding-left: 0;
    background-image: none;
    background-color: var(--site-background);
    background-size: 100% 100%;
}

figure a:hover {
    color: var(--nav-a-hover);
    padding-left: 0;
    background-image: none;
    background-color: var(--site-background);
    background-size: 100% 100%;
}

figure img:hover {
    box-shadow: var(--shadow-elevation-medium);
}

aside {
    display: block;
    max-width: 962px;
    margin-left: auto;
    margin-right: auto;
    margin-top: 1.5rem;
    padding-left: 0;
}

.aside-list {
    display: block;
    width: 878px;
    margin-left: auto;
    margin-right: auto;
    margin-top: 1.5rem;
    padding-left: 0;
}

.aside-card {
    box-shadow: var(--shadow-elevation-low);
    padding: 1rem;
    margin-bottom: 2rem;
}

.aside-card-list {
    box-shadow: var(--shadow-elevation-low);
    padding: 1rem;
    margin-bottom: 2rem;
}

.aside-card-list-top {
    margin-top: 8rem;
}

.aside-card-title {
    margin-bottom: 1rem;
    color: var(--h1);
    text-transform: uppercase;
    font-size: 1.5rem;
    font-weight: 800;
}

.aside-list .aside-card-title {
    font-size: 1.25rem;
}

.aside-card-subtitle {
    color: var(--summary);
    margin-bottom: 30px;
    margin-top: -0.9rem;
    font-size: 1.1rem;
    font-weight: 600;
}

.aside-card-image {
    float: left;
    width: 92px;
    height: 92px;
    margin-top: 5px;;
    margin-right: 30px;
    margin-bottom: 5px;
}

.aside-card-image img {
    width: 100%;
    height: auto;
    margin: 0;
    transition: 0.5s;
    box-shadow: var(--shadow-elevation-low);
}

.aside-card-image img:hover {
    box-shadow: var(--shadow-elevation-medium);
}

.aside-card .terms-container ul {
    display: flex;
    justify-content: flex-start;
    flex-flow: row wrap;
    list-style: none;
    padding-left: 0;
}

.aside-card .terms-container li {
    padding-right: 1.5rem;
}

.related-entries {
    list-style: none;
    padding-left: 0;
    margin-bottom: 0;
}

.related-link-container {
    display: flex;
    flex-direction: row;
    justify-content: flex-start;
    padding-bottom: 1rem;
}

.related-link-container .related-link-title {
    text-decoration: none;
    text-decoration-color: var(--logo-low);
    // background-image: linear-gradient(to bottom, var(--logo-high) 0%, var(--logo-low) 100%);
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent; 
}

.related-link-image {
    transition: 0.2s;
    width: 92px;
    height: 92px;
    min-width: 92px;
    // box-shadow: var(--shadow-elevation-low);
}

.related-link-image img {
    width: 100%;
    height: auto;
    margin: 0;
}

.related-link-container:hover .related-link-image {
    // box-shadow: var(--shadow-elevation-medium);
}

.related-link-title {
    transition: 0.2s;
    padding-left: 1rem;
    height: 100%;
    margin-top: auto;
    margin-bottom: auto;
}

/*
.related-link-container:hover .related-link-title {
    text-decoration: none;
    text-decoration-color: var(--logo-high);
    background-image: linear-gradient(to top, var(--logo-high) 0%, var(--logo-low) 100%);
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
}
*/

.sharing-links svg {
    width: 1.5rem;
    height: 1.5rem;
}

.sharing-links stop {
    transition: 0.2s;
}

.sharing-links svg stop:first-child {
    stop-color: var(--logo-high);
}

.sharing-links svg:hover stop:first-child {
    stop-color: var(--logo-low);
}

.sharing-links svg stop:last-child {
    stop-color: var(--logo-low);
}

.sharing-links svg:hover stop:last-child {
    stop-color: var(--logo-high);
}



/* List page styling */
.list-page-container {
    max-width: 1536px;
    display: block;
    margin: auto;
}

.list-page-container h1 {
    margin-bottom: -20px;
    margin-left: 15px;
    text-transform: lowercase;
    font-size: 2.5rem;
    font-weight: 300;
}

#list-page-title {
    margin-bottom: -20px;
    margin-left: 0px;
    text-transform: uppercase;
    font-size: 2.5rem;
    font-weight: 800;
}

.list-page-terms-container {
    margin-top: 3rem;
    display: flex;
    justify-content: flex-start;
    flex-flow: row wrap;
    margin-left: auto;
    margin-right: auto;
}

.list-page-terms {
    margin-top: 0.75rem;
    margin-right: 3rem;
    text-transform: lowercase;
    font-size: 1.8rem;
    font-weight: 300;
}

#list-page-section-title {
    margin-bottom: -20px;
    margin-left: 15px;
    text-transform: uppercase;
    font-size: 2.5rem;
    font-weight: 800;
}

.list-stories-block {
    max-width: 962px;
    display: block;
    margin-top: 2rem;
}

.list-story-generic-block {
    display: flex;
    justify-content: space-between;
    max-width: 962px;
    min-width: 275px;
    margin-right: auto;
    margin-left: 0;
    padding: 1.5rem;
    box-shadow: var(--shadow-elevation-low);
}

.list-story-generic-block-text {
    margin-right: 1rem;
}

.list-story-generic-block-text h2 {
    margin-top: 0;
    font-size: 1.25rem;
}

.list-story-generic-block-author {
    margin-left: 30px;
}

.list-story-generic-block-reading-time {
    margin-left: 30px;
}

.list-story-generic-block-image-rectangle img {
    margin: 0;
    min-width: 220px;
}

.list-story-generic-block-image-square img {
    margin: 0;
    min-width: 92px;
}

.list-story-generic-block-image-square {
    margin-top: 7px;
    margin-right: 0;
}

.list-story-generic-block-summary {
    color: var(--summary);
    margin-top: 0;
    margin-bottom: 30px;
    font-size: 1.1rem;
    font-weight: 600;
}

.list-story-generic-block-entry-info {
    display: flex;
    justify-content: flex-start;
    align-contents: left;
    font-style: italic;
    font-size: 0.8rem;
    font-weight: 400;
    margin-top: 10px;
}

.pagination {
    display: flex;
    justify-content: center;
    flex-flow: row wrap;
    list-style: none;
    padding-left: 0;
    margin-top: 100px;
}

.page-item {
    margin-right: 2rem;
}

.page-item:last-child {
    margin-right: 0;
}

.page-item a {
    text-decoration: none;
    color: var(--nav-a);
    background-image: none;
    background-color: var(--site-background);
}

.page-item a:hover {
    text-decoration: none;
    color: var(--nav-a-hover);
    background-image: none;
    background-color: var(--site-background);
}

.page-item.active a {
    text-decoration: none;
    color: var(--nav-a-active);
    background-image: none;
    background-color: var(--site-background);
}

.page-item.disabled a {
    text-decoration: none;
    color: var(--summary);
    background-image: none;
    background-color: var(--site-background);
}

#section-title {
    font-weight: 800;
    color: var(--h1);
    text-transform: uppercase;
    margin-top: 0;
    margin-bottom: 1rem;
    margin-left: 1rem;
    font-size: 2rem;
}

#section-pull-banner {
    position: relative;
    z-index: 0;
}

#section-pull-banner img {
    width: 100%;
    height: auto;
    margin: 0;
}

#section-pull-top-story-small {
    border: solid 1px var(--summary);
    border-bottom: none;
    padding-top: 1rem;
    padding-bottom: 1rem;
}

#section-pull-top-story {
    position: absolute;
    top: 2.5%;
    left: 1.5%;
    width: 97%;
    background-color: var(--site-background);
    box-shadow: var(--shadow-elevation-medium);
    padding: 1%;
    z-index: 10;
}

#section-pull-top-summary {
    color: var(--summary);
    margin-top: 1rem;
    margin-bottom: 1rem;
    margin-left: 3rem;
    margin-right: 2rem;
    font-size: 1.1rem;
    font-weight: 600;
}

.section-pull-top-title {
    font-weight: 800;
    color: var(--h1);
    text-transform: uppercase;
    margin-top: 0;
    margin-bottom: 0;
    margin-left: 4rem;
    margin-right: 2rem;
    font-size: 1.5rem;
}

#section-pull-top-stories {
    width: 100%;
    color: var(--site-background);
    background-color: var(--summary);
    padding: 0;
    margin-top: -10px;
}

.top-three {
    padding: 5px;
    padding-top: 17px;
}

.top-three:first-child {
    padding-top: 1rem;
}

.top-three:last-child {
    margin-right: 0;
}

.top-three-summary {
    margin-top: 1rem;
    margin-bottom: 1rem;
    margin-left: 3rem;
    margin-right: 2rem;
    font-size: 1.1rem;
    font-weight: 600;
}

.top-three-title {
    font-weight: 800;
    text-transform: uppercase;
    margin-top: 0;
    margin-bottom: 0.5rem;
    margin-left: 3rem;
    margin-right: 2rem;
    font-size: 1.1rem;
}

.top-three a {
    color: var(--site-background);
}

.top-three a:hover {
    color: var(--logo-high);
}

.top-three-separator {
    position: absolute;
    padding-bottom: 2px;
    height: 0;
    width: 100%;
    left: 50%;
    margin-left: -50%;
    margin-top: 2px;
    background: linear-gradient( to right, var(--logo-high) 0%, var(--logo-low) 100% ) left bottom var(--site-background) no-repeat;
    background-size: 100% 2px;
}

.section-boxes-container {
    margin-top: 1rem;
}

.section-boxes-section-container {
    margin-top: 2rem;
    padding: 1.5rem;
    box-shadow: var(--shadow-elevation-low);
}

.section-boxes-section-title {
    font-size: 1.25rem;
    font-weight: 800;
    text-transform: uppercase;
    margin-bottom: 0.5rem;
}

.section-boxes-section-container img {
    margin: 0;
    width: 100%;
    height: auto;
}

.section-boxes-section-container ul {
    list-style: none;
    padding-left: 0;
    margin-top: 0.5rem;
    margin-bottom: 0;
}

.section-boxes-section-container li {
    padding-bottom: 1rem;
}

.section-boxes-section-container li:last-child {
    padding-bottom: 0;
}

.section-boxes-category {
    font-size: 1rem;
    font-weight: 400;
}

.section-boxes-title {
    text-transform: uppercase;
    font-size: 1.1rem;
    font-weight: 800;
}

.more-on h1 {
    margin-top: 4rem;
    margin-left: 15px;
    font-size: 2rem;
}



/* Footer styling */
footer {
    padding: 2rem;
}

.footer-line {
    max-width: 1536px;
    display: flex;
    justify-content: center;
    flex-flow: row wrap;
    margin: auto;
}
    
.footer-line ul {
    display: flex;
    justify-content: center;
    flex-flow: row wrap;
    list-style: none;
    padding: 0;
}
    
.footer-line li {
    padding-right: 30px;
}
    
.footer-line li:last-child {
    padding-right: 0;
}



/* Media query overrides --- all styling before this point assumes a mobile device being used to print to paper. */
@media screen and (min-width: 900px) {
    /* Remove top nav sections when screen is too small, and adjust placement of site logo. */
    .topnav-sections {
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        gap: 2em;
        list-style: none;
        text-transform: uppercase;
        font-size: 1.3rem;
        font-weight: 800;
    }
    
    .homelink {
        padding-right: 7rem;
    }

    .top-three {
	padding-top: 5px;
    }
    
    .list-story-generic-block-text {
	margin-right: 3rem;
    }
    
    .list-story-generic-block-image-rectangle {
	display: block;
    }

    .list-story-generic-block-image-square {
	display: none;
    }

    .list-story-generic-block-entry-info {
	margin-top: 0;
    }

    .list-story-generic-block-summary {
	display: block;
    }

    .list-story-generic-block-author {
	display: block;
    }

    .list-story-generic-block-word-count {
	display: block;
    }

    .list-story-generic-block-text h2 {
	font-size: 1.5rem;
    }

    .section-boxes-container {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        gap: 2em;
    }

    .section-boxes-section-title {
	font-size: 1.5rem;
    }

    .section-boxes-category {
	font-size: 1.2rem;
    }
    
    .section-boxes-title {
	font-size: 1.25rem;
    }

    .more-on h1 {
	margin-top: 5rem;
	font-size: 2.5rem;
    }

    .aside-list {
	max-width: 900px;
    }

    .aside-list .aside-card-title {
	font-size: 1.5rem;
    }

    #section-pull-top-stories {
	display: block;
	position: static;
	width: 100%;
	color: var(--site-background);
	background-color: var(--summary);
	padding: 0;
	margin-top: -10px;
    }

    .section-pull-top-title {
	font-size: 2rem;
	margin-bottom: 1rem;
    }

    #section-pull-top-summary {
	display: block;
    }

    .top-three-summary {
	display: flex;
	margin-bottom: 0.25rem;
    }

    .top-three-title {
	font-size: 1.5rem;
	margin-top: 0.25rem;
	margin-bottom: 0.5rem;
    }
}



@media screen and (min-width: 1580px) {
    aside {
	display: block;
	max-width: 550px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 1.5rem;
	padding-left: 65px;
    }

    .aside-list {
	display: block;
	max-width: 550px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 1.5rem;
	padding-left: 65px;
    }

    #section-pull-top-story-small {
	display: none;
    }

    #section-pull-top-story {
	display: block;
	position: absolute;
	top: 2.5%;
	left: 1.5%;
	width: 97%;
	background-color: var(--site-background);
	box-shadow: var(--shadow-elevation-medium);
	padding: 1%;
	z-index: 10;
    }

    .section-pull-top-title {
	font-size: 2rem;
    }

    #section-pull-top-summary {
	display: block;
    }

    #section-pull-top-stories {
	display: flex;
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	color: var(--site-background);
	background-color: var(--summary);
	padding: 0;
	z-index: 5;
    }

    .top-three-separator-large {
	display: block;
	position: absolute;
	padding-bottom: 2px;
	height: 0;
	width: 100%;
	left: 50%;
	margin-left: -50%;
	margin-top: -2px;
	background: linear-gradient( to right, var(--logo-high) 0%, var(--logo-low) 100% ) left bottom var(--site-background) no-repeat;
	background-size: 100% 2px;
    }

    .top-three-separator {
	display: none;
    }

    .top-three-summary {
	display: flex;
	margin-bottom: 1rem;
    }

    .top-three-title {
	margin-top: 1rem;
    }
}



@media screen {
    .print-hidden-flex {
	display: flex;
    }

    .print-hidden-block {
	display: block;
    }

    a {
	transition: 0.1s;
    }
    
    a {
	text-decoration: none;
	text-decoration-color: var(--logo-low);
	background-image: linear-gradient(to bottom, var(--logo-high) 0%, var(--logo-low) 100%);
	-webkit-background-clip: text;
	background-clip: text;
	color: transparent;
    }
    
    a:hover {
	text-decoration: none;
	text-decoration-color: var(--logo-high);
	background-image: linear-gradient(to top, var(--logo-high) 0%, var(--logo-low) 100%);
	-webkit-background-clip: text;
	background-clip: text;
	color: transparent;
    }
    
    a:active {
	color: var(--a-active);
    }

    .sharing-links ul {
	display: flex;
	justify-content: flex-start;
	flex-flow: row wrap;
	list-style: none;
	padding-left: 0;
    }
    
    .topnav {
	display: flex;
	margin-top: -8rem;
	position: fixed;
	width: 100%;
	overflow: hidden;
	padding-left: 10px;
	padding-bottom: 2px;  /* Needed to allow background gradient to be visible */
	background:
            linear-gradient(
		to right,
		var(--logo-high) 0%,
		var(--logo-low) 100%
            )
            left
            bottom
            var(--site-background)
            no-repeat;
	background-size: 100% 2px;  /* Resize needed when using linear-gradient for background */
	box-shadow: var(--shadow-elevation-medium);
	z-index: 90;
    }
}
