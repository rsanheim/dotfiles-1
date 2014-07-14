// Adds a live filter box to the results screen on craigslist
// that filters the results that are currently on the page by
// the search term. Like Cmd-F, but better.

// NOTE: Requires dotjs.

var searchBox = $('<input type="text" id="result-search" />')

$("h4.ban:first").before(searchBox)

$("#result-search").live("change", function() {
  var results   = $("p.row")
  var search    = this.value;
  var searchExp = new RegExp(search, "gi")

  console.log("search term:" + search)

  if (search != "") {
    results.filter(function() {
      if(!$(this).text().match(searchExp)) {
        $(this).hide()
      }
    })
  } else {
    // show all for a blank search term
    results.show()
  }
})
