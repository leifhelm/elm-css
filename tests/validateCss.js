const compileToString = require("node-elm-compiler").compileToString;
const nodeEval = require("node-eval");
const validateCss = require("css-validator-no-cli");
const assert = require("assert");

compileToString(["src/Main.elm"], {cwd: "./validate-css"}).then(function(data) {
    var test = nodeEval(data.toString());
    var app = test.Elm.Main.init();
    app.ports.cli__send.subscribe(function(css) {
        validateCss({
            text: css
        }, function(err, data) {
            if (data.errors.length > 0){
                console.error("ERRORS:");
                console.error(data.errors);
            }
            if (data.warnings.length > 0){
                console.error("WARNINGS:");
                console.error(data.warnings);
            }
            assert.strictEqual(data.validity, true);
            assert.deepEqual(data.errors, []);
            assert.deepEqual(data.warnings, []);
        });
        console.log(css);
    });
});
