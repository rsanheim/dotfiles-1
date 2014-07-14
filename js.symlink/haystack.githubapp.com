
    // for example:
    needle = "503156ed28bd192807008bbb";

    win = function () { 
      alert("sweet!");
    };

    failure = function () {
      alert("zomg wtfffff");
    };

    $.ajax({
      url: "http://haystack.githubapp.com/needles/" + needle + ".txt",
      success: win,
      error: failure
    });
