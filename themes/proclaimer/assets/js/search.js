var summaryInclude = 180;
var fuseOptions = {
    shouldSort: true,
    includeMatches: true,
    includeScore: true,
    tokenize: true,
    location: 0,
    distance: 100,
    minMatchCharLength: 1,
    keys: [
        {name: "title", weight: 0.45},
        {name: "contents", weight: 0.4},
        {name: "tags", weight: 0.1},
        {name: "categories", weight: 0.05}
    ]
};

/* =============================
Search
============================= */
var inputBox = document.getElementById('search-query');
if (inputBox !== null) {
    var searchQuery = param("q");
    if (searchQuery) {
	inputBox.value = searchQuery || "";
    }
}

if (param("q") !== null) {
    executeSearch(param("q"), false);
} else {
    document.getElementById('search-results').innerHTML = '<p class="search-results-empty">Please enter a word or phrase above, or see <a href="/tags/">all tags</a>.</p>';
}

function executeSearch(searchQuery) {
    show(document.querySelector('.search-loading'));
    fetch('/index.json').then(function (response) {
	if (response.status !== 200) {
	    console.log('Looks like there was a problem. Status Code: ' + response.status);
	    return;
	}
	// Examine the text in the response
	response.json().then(function (pages) {
	    var fuse = new Fuse(pages, fuseOptions);
	    var result = fuse.search(searchQuery);
	    if (result.length > 0) {
		populateResults(result);
	    } else {
		document.getElementById('search-results').innerHTML = '<p class=\"search-results-empty\">No matches found</p>';
	    }
	    hide(document.querySelector('.search-loading'));
	})
	    .catch(function (err) {
		console.log('Fetch Error :-S', err);
	    });
    });
}

function populateResults(results) {
    var searchQuery = param("q");
    var searchPagerSize = Number.parseInt(param("s"));
    if (searchPagerSize < 1) { searchPagerSize = 5; }
    var searchPage = Number.parseInt(param("p"));
    if (searchPage < 1) { searchPage = 1; }
    var numberOfPages = 1;
    var paginationOutput = "";
    var searchResults = document.getElementById("search-results");
    // Pull templates from hugo template definitions
    var templateDefinition = document.getElementById("search-result-template").innerHTML;
    var templatePaginationDefinition = document.getElementById("search-pagination-template").innerHTML;
    var templatePaginationPageDefinition = document.getElementById("search-pagination-page-template").innerHTML;
    var searchTitle = document.getElementById("search-title");
    if (results.length > searchPagerSize) {
	numberOfPages = Math.ceil(results.length / searchPagerSize);
    }
    if (searchPage > numberOfPages) {
	searchPage = numberOfPages;
    }
    if (numberOfPages > 1) {
	results = results.slice(((searchPage-1)*searchPagerSize),(searchPage*searchPagerSize));
	var startActivationClass = "";
	var startTabIndex = "";
	var firstHref = "href=\"/search/?q=" + searchQuery.replace(/\s/g, "+") + "&p=1&s=" + searchPagerSize.toString() + "\"";
	var prevHref = "href=\"/search/?q=" + searchQuery.replace(/\s/g, "+") + "&p=" + (searchPage - 1).toString() + "&s=" + searchPagerSize.toString() + "\"";
	var pages = "";
	var nextHref = "href=\"/search/?q=" + searchQuery.replace(/\s/g, "+") + "&p=" + (searchPage + 1).toString() + "&s=" + searchPagerSize.toString() + "\"";
	var lastHref = "href=\"/search/?q=" + searchQuery.replace(/\s/g, "+") + "&p=" + numberOfPages.toString() + "&s=" + searchPagerSize.toString() + "\"";
	var endTabIndex = "";
	var endActivationClass = "";
	if (searchPage == 1) {
	    startActivationClass = " disabled";
	    startTabIndex = " tabindex=\"-1\"";
	    firstHref = "aria-disabled=\"true\"";
	    prevHref = "aria-disabled=\"true\"";
	}
	if (searchPage == numberOfPages) {
	    endActivationClass = " disabled";
	    endTabIndex = " tabindex=\"-1\"";
	    lastHref = "aria-disabled=\"true\"";
	    nextHref = "aria-disabled=\"true\"";
	}
	for (let i = 1; i < (numberOfPages+1); i++) {
	    var activationClass = "";
	    var href = "href=\"/search/?q=" + searchQuery.replace(/\s/g, "+") + "&p=" + i.toString() + "&s=" + searchPagerSize.toString() + "\"";
	    var page = i.toString();
	    if ( i == searchPage ) {
		activationClass = " active";
		href = "aria-current=\"page\"";
	    }
	    var currentPage = render(templatePaginationPageDefinition, {
		activationClass: activationClass,
		href: href,
		page: page
	    });
	    pages += currentPage;
	}
	paginationOutput = render(templatePaginationDefinition, {
	    startActivationClass: startActivationClass,
	    startTabIndex: startTabIndex,
	    firstHref: firstHref,
	    prevHref: prevHref,
	    pages: pages,
	    nextHref: nextHref,
	    lastHref: lastHref,
	    endTabIndex: endTabIndex,
	    endActivationClass: endActivationClass
	});
    }
    
    results.forEach(function (value, key) {
	var contents = value.item.contents;
	var snippet = "";
	var snippetHighlights = [];
	snippetHighlights.push(searchQuery);
	snippet = contents.substring(0, summaryInclude * 2) + '&hellip;';
	// Replace values
	var tags = ""
	if (value.item.tags) {
	    value.item.tags.forEach(function (element) {
		tags = tags + "<a href='/tags/" + element.replace(/\s/g, "-").toLowerCase() + "'>" + "#" + element.replace(/\s/g, "-").toLowerCase() + "</a> "
	    });
	}
	var output = render(templateDefinition, {
	    key: key,
	    title: value.item.title,
	    link: value.item.permalink,
	    tags: tags,
	    categories: value.item.categories,
	    snippet: snippet
	});
	searchResults.innerHTML += output;
	snippetHighlights.forEach(function (snipvalue, snipkey) {
	    var instance = new Mark(document.getElementById('summary-' + key));
	    instance.mark(snipvalue);
	});
    });
    searchResults.innerHTML += paginationOutput;
    searchTitle.innerHTML += ": " + searchQuery;
}

function render(templateString, data) {
    var conditionalMatches, conditionalPattern, copy;
    conditionalPattern = /\$\{\s*isset ([a-zA-Z]*) \s*\}(.*)\$\{\s*end\s*}/g;
    // Since loop below depends on re.lastInxdex, we use a copy to capture any manipulations whilst inside the loop
    copy = templateString;
    while ((conditionalMatches = conditionalPattern.exec(templateString)) !== null) {
	if (data[conditionalMatches[1]]) {
	    // Valid key, remove conditionals, leave contents.
	    copy = copy.replace(conditionalMatches[0], conditionalMatches[2]);
	} else {
	    // Not valid, remove entire section
	    copy = copy.replace(conditionalMatches[0], '');
	}
    }
    templateString = copy;
    // Now any conditionals removed we can do simple substitution
    var key, find, re;
    for (key in data) {
	find = '\\$\\{\\s*' + key + '\\s*\\}';
	re = new RegExp(find, 'g');
	templateString = templateString.replace(re, data[key]);
    }
    return templateString;
}

// Helper Functions
function show(elem) {
    elem.style.display = 'block';
}
function hide(elem) {
    elem.style.display = 'none';
}
function param(name) {
    return decodeURIComponent((location.search.split(name + '=')[1] || '').split('&')[0]).replace(/\+/g, ' ');
}
