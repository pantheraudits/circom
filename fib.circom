pragma circom  2.0.6;

function testfeb(fib1, fib2, n) {
    var a = fib1;
    var b = fib2;
    var c;
    for (var i = 2; i < n; i++) {
        c = a + b;
        a = b;
        b = c;
    }
    return c;
}