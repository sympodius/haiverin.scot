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
    0.01875rem 0.03125rem 0.05625rem hsl(var(--shadow-color) / 0),
    0.0375rem 0.06875rem 0.11875rem hsl(var(--shadow-color) / 0.35),
    0.08125rem 0.15625rem 0.2625rem hsl(var(--shadow-color) / 0.69);
  --shadow-elevation-medium:
    0.01875rem 0.03125rem 0.05rem hsl(var(--shadow-color) / 0.23),
    0.06875rem 0.1375rem 0.2rem -0.025rem hsl(var(--shadow-color) / 0.34),
    0.15625rem 0.3125rem 0.45625rem -0.05rem hsl(var(--shadow-color) / 0.45),
    0.35rem 0.70625rem 1.0375rem -0.075rem hsl(var(--shadow-color) / 0.57);
  --shadow-elevation-high:
    0.01875rem 0.03125rem 0.04375rem hsl(var(--shadow-color) / 0.34),
    0.09375rem 0.18125rem 0.23125rem -0.025rem hsl(var(--shadow-color) / 0.34),
    0.16875rem 0.3375rem 0.425rem -0.04375rem hsl(var(--shadow-color) / 0.34),
    0.28125rem 0.55625rem 0.7rem -0.06875rem hsl(var(--shadow-color) / 0.34),
    0.44375rem 0.89375rem 1.125rem -0.0875rem hsl(var(--shadow-color) / 0.34),
    0.7rem 1.39375rem 1.75625rem -0.1125rem hsl(var(--shadow-color) / 0.34),
    1.0625rem 2.11875rem 2.66875rem -0.13125rem hsl(var(--shadow-color) / 0.34),
    1.5625rem 3.125rem 3.93125rem -0.15625rem hsl(var(--shadow-color) / 0.34);
  --input-border: var(--logo-high);
  --input-focus: var(--logo-low);
    }



/* Use border-box everywhere for box-sizing, plus other resets. */
*,
*::before,
*::after {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    border: 0;
}



/* General tag styling. */
body {
    min-height: 100vh;
    color: var(--body-text);
    background-color: var(--site-background);
    font-family: "Noto Sans", sans-serif;
    font-optical-sizing: auto;
    font-weight: 400;
    font-style: normal;
    font-variation-settings: "wdth" 100;
    line-height: 1.5;
}

header {
    margin-bottom: 8rem;
    background-color: var(--site-background);
}

footer {
    padding-top: 0.125rem;  /* Needed to allow background gradient to be visible */
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
    background-size: 100% 0.125rem;  /* Resize needed when using linear-gradient for background */
    margin-top: 1rem;
}

/* This is used to check if CSS is disbled by applying it to an empty div tag. */
#css-tester {
    width: 3px;
}

p {
    margin-top: 1rem;
    margin-bottom: 1rem;
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
    margin-bottom: 1rem;
    padding-left: 2.5rem;
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
    margin-left: 0.625rem;
    margin-top: 0;
}

#hamburger-menu svg {
    width: 2.5rem;
    height: 2.5rem;
}

.menu-close-icon-container {
    width: 2.5rem;
    height: 2.5rem;
    margin-top: 0.625rem;
    margin-left: 0.3125rem;
}

.menu-close-icon-container svg {
    width: 2.5rem;
    height: 2.5rem;
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
    padding-right: 1.25rem;
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
    top: 1.4375rem;
    right: 1.25rem;
}

.search-loading {
    margin-top: 2rem;
}

.search-icon-container {
    width: 2.5rem;
    height: 2.5rem;
}

/* This adds a little colour transition, and shadow animation after the search box appears. */
#search-query {
    transition: 1s;
}

.searchbar {
    font-size: 1rem;
    font-family: inherit;
    padding: 0.25em 0.5em;
    background-color: var(--site-background);
    border: 0.125rem solid var(--input-border);
    border-radius: 0.25rem;
    box-shadow: var(--shadow-elevation-medium);
    outline: 0.1875rem solid transparent;
}

.searchbar:not(textarea) {
    line-height: 1;
    height: 2.25rem;
    outline: 0.1875rem solid transparent;
}

.searchbar {
    transition: 0.2s;
}

.searchbar:focus {
    border-color: var(--input-focus);
    box-shadow: var(--shadow-elevation-high);
    outline: 0.1875rem solid transparent;
}

.top-search svg {
    width: 2.5rem;
    height: 2.5rem;
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
    margin: 0.625rem 0 0.625rem 0;
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
  margin-bottom: -0.375rem;
  height: {{ site.Params.logo.height | default "3.75rem" }};
  width: {{ site.Params.logo.width | default "3.75rem" }};
}

.topnav ul {
    padding: 0;
    margin: 0.625rem 1rem 0.625rem 1rem;
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
    top: 0.3125rem;
    left: 0.3125rem;
    font-size: 1rem;
    font-family: inherit;
    padding: 0.25em 0.5em;
    background-color: var(--site-background);
    border: 0.125rem solid var(--logo-high);
    border-radius: 0.25rem;
    box-shadow: var(--shadow-elevation-medium);
    outline: 0.1875rem solid transparent;
}

.side-menu-sections {
    list-style: none;
    text-transform: uppercase;
    font-size: 1.3rem;
    font-weight: 800;
}

.side-menu-sections li {
    margin-top: 1.25rem;
}

.side-menu-sections .side-menu-categories {
    list-style: none;
    text-transform: lowercase;
    font-size: 1.6rem;
    font-weight: 300;
    margin: 0 1rem 0 1rem;
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
    width: 60.125rem;
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
    margin-bottom: 1.875rem;
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
    margin-left: 1.875rem;
}

.reading-difficulty {
    margin-left: 1.875rem;
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
    margin-top: 0.625rem;
    margin-right: 0.625rem;
}

.sharing-links li:last-child {
    margin-right: 0;
}

main {
    padding: 2rem;
    padding-top: 0;
    min-width: 19.1729375rem;
}

.single-page-container {
    max-width: 96rem;
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
    transition: 0.5s;
}

.banner-image img {
    width: 100%;
}

figure figcaption {
    text-align: center;
    font-size: 0.8rem;
    font-weight: 400;
    margin-top: -0.75rem;
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
    width: 60.125rem;
    margin-left: auto;
    margin-right: auto;
    margin-top: 1.5rem;
    padding-left: 0;
}

.aside-list {
    display: block;
    margin-left: 0;
    margin-right: 0;
    margin-top: 1.5rem;
    padding-left: 0;
}

.aside-card {
    box-shadow: var(--shadow-elevation-low);
    padding: 1.5rem;
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
    margin-bottom: 1.875rem;
    margin-top: -0.9rem;
    font-size: 1.1rem;
    font-weight: 600;
}

.aside-card-image {
    float: left;
    width: 5.75rem;
    height: 5.75rem;
    margin-top: 0.3125rem;
    margin-right: 1.875rem;
    margin-bottom: 0.3125rem;
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
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent; 
}

.related-link-image {
    transition: 0.2s;
    width: 5.75rem;
    height: 5.75rem;
    min-width: 5.75rem;
}

.related-link-image img {
    width: 100%;
    height: auto;
    margin: 0;
}

.related-link-title {
    transition: 0.2s;
    padding-left: 1rem;
    height: 100%;
    margin-top: auto;
    margin-bottom: auto;
}

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
    max-width: 96rem;
    display: block;
    margin: auto;
}

.list-page-container h1 {
    margin-bottom: -1.25rem;
    margin-left: 0.9375rem;
    text-transform: lowercase;
    font-size: 2.5rem;
    font-weight: 300;
}

#list-page-title {
    margin-bottom: -1.25rem;
    margin-left: 0;
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
    margin-bottom: -1.25rem;
    margin-left: 0.9375rem;
    text-transform: uppercase;
    font-size: 2.5rem;
    font-weight: 800;
}

.list-stories-block {
    max-width: 60.125rem;
    display: block;
    margin-top: 2rem;
}

.list-story-generic-block {
    display: flex;
    justify-content: space-between;
    max-width: 60.125rem;
    margin-right: auto;
    margin-left: 0;
    padding: 1.5rem;
    box-shadow: var(--shadow-elevation-low);
}

.list-story-generic-block-text {
    margin-right: 1rem;
    min-width: 8.4375rem;
}

.list-story-generic-block-text h2 {
    margin-top: 0;
    font-size: 1.25rem;
}

.list-story-generic-block-author {
    margin-left: 1.875rem;
}

.list-story-generic-block-reading-time {
    margin-left: 1.875rem;
}

.list-story-generic-block-image-rectangle img {
    margin: 0;
    min-width: 13.75rem;
}

.list-story-generic-block-image-square img {
    margin: 0;
    max-width: 5.75rem;
    min-width: 5.75rem;
}

.list-story-generic-block-image-square {
    margin-top: 0.4375rem;
    margin-right: 0;
}

.list-story-generic-block-summary {
    color: var(--summary);
    margin-top: 0;
    margin-bottom: 1.875rem;
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
    margin-top: 0.625rem;
}

.pagination {
    display: flex;
    justify-content: center;
    flex-flow: row wrap;
    list-style: none;
    padding-left: 0;
    margin-top: 6.25rem;
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

.section-pull-banner-image-small, .section-pull-banner-image-medium {
    border-left: solid 0.0625rem var(--summary);
    border-right: solid 0.0625rem var(--summary);
}

#section-pull-top-story-small {
    border: solid 0.0625rem var(--summary);
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
    margin-top: -0.625rem;
}

.top-three {
    padding: 0.3125rem;
    padding-top: 1.0625rem;
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
    padding-bottom: 0.125rem;
    height: 0;
    width: 100%;
    left: 50%;
    margin-left: -50%;
    margin-top: 0.125rem;
    background: linear-gradient( to right, var(--logo-high) 0%, var(--logo-low) 100% ) left bottom var(--site-background) no-repeat;
    background-size: 100% 0.125rem;
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
    margin-left: 0.9375rem;
    font-size: 2rem;
}



/* Footer styling */
footer {
    padding: 2rem;
}

.footer-line {
    max-width: 96rem;
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
    padding-right: 1.875rem;
}
    
.footer-line li:last-child {
    padding-right: 0;
}



/* Media query overrides --- all styling before this point assumes a mobile device being used to print to paper. */
@media screen and (min-width: 56.25rem) {
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

    .section-pull-banner-image-small {
	display: none;
    }

    .section-pull-banner-image-medium {
	display: block;
    }

    .top-three {
	padding-top: 0.3125rem;
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
	max-width: 60.125rem;
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
	margin-top: -0.625rem;
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



@media screen and (min-width: 98.75rem) {
    .section-pull-banner-image-medium {
	display: none;
    }

    .section-pull-banner-image-large {
	display: block;
    }

    aside {
	display: block;
	max-width: 34.375rem;
	margin-left: auto;
	margin-right: auto;
	margin-top: 1.5rem;
	padding-left: 4.0625rem;
    }

    .aside-list {
	display: block;
	max-width: 34.375rem;
	margin-left: auto;
	margin-right: auto;
	margin-top: 1.5rem;
	padding-left: 4.0625rem;
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
	justify-content: flex-start;
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
	padding-bottom: 0.125rem;
	height: 0;
	width: 100%;
	left: 50%;
	margin-left: -50%;
	margin-top: -0.125rem;
	background: linear-gradient( to right, var(--logo-high) 0%, var(--logo-low) 100% ) left bottom var(--site-background) no-repeat;
	background-size: 100% 0.125rem;
    }

    .top-three {
	width: calc(100% / 3);
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
	padding-left: 0.625rem;
	padding-bottom: 0.125rem;  /* Needed to allow background gradient to be visible */
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
	background-size: 100% 0.125rem;  /* Resize needed when using linear-gradient for background */
	box-shadow: var(--shadow-elevation-medium);
	z-index: 90;
    }
}
