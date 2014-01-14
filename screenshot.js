var args = require('system').args;

if (args.length === 3) {
    var url = args[1];
    var filename = args[2];

    var page = require('webpage').create();
    page.viewportSize = { width: 1024, height: 768 };
    page.open(url, function () {
        page.onConsoleMessage = function (msg) {
            console.log(msg);
        };

        window.setTimeout(function () {
            page.render(filename);
            phantom.exit();
        }, 1000);
    });
}
else {
    console.log('usage: phantomjs screenshot.js url filename');
}