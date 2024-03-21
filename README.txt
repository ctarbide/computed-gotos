
This is just an experiment on [1], the interpreter logic is identical to the
original.

From [2] I assume the code follows the Unlicense License. You can assume the
same license from me on the shell scripts and the added variants.

The results on a 100-byte randomly generated program:

    + ./main
    131 131 131 131 131 131
    0
    + echo

    + time -p ./main_switch
    96
    real 1.59
    user 1.59
    sys 0.00
    + echo

    + time -p ./main_cgoto
    96
    real 0.64
    user 0.63
    sys 0.00
    + echo

    + time -p ./main_call
    96
    real 1.56
    user 1.56
    sys 0.00
    + echo

    + time -p ./main_cgotow
    96
    real 1.06
    user 1.06
    sys 0.00
    + echo

    + time -p ./main_switchc
    96
    real 1.18
    user 1.18
    sys 0.00
    + echo

    + time -p ./main_sgoto
    96
    real 1.65
    user 1.65
    sys 0.00
    + echo

    + echo all done
    all done


- [1]: https://eli.thegreenplace.net/2012/07/12/computed-goto-for-efficient-dispatch-tables/

- [2]: https://github.com/eliben/code-for-blog
