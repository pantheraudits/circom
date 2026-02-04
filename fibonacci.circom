pragma circom  2.0.6;

include "fib.circom";

template fibonacci(n) {
   signal input fib1;
   signal input fib2;
   signal output fibn;
    
   // Set the output
   fibn <== testfeb(fib1, fib2, n) * fib1;
   log();
}

component main = fibonacci(1000);
