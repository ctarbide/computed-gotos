
This is just an experiment on [1], the interpreter logic is identical to the
original.

From [2] I assume the code follows the Unlicense License. You can assume the
same license from me on the shell scripts and interp_call.c (function table
variant).

The results on a 100-byte randomly generated program:

    $ ./test.sh
    + ./main
    131 131 131
    0
    + echo

    + ./main_switch
    96

    real    0m2.022s
    user    0m2.019s
    sys     0m0.003s
    + echo

    + ./main_cgoto
    96

    real    0m0.855s
    user    0m0.854s
    sys     0m0.001s
    + echo

    + ./main_call
    96

    real    0m2.069s
    user    0m2.069s
    sys     0m0.000s
    + echo

    + echo all done
    all done


- [1]: https://eli.thegreenplace.net/2012/07/12/computed-goto-for-efficient-dispatch-tables/

- [2]: https://github.com/eliben/code-for-blog
