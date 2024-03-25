contact Example{
    function foo()
    {
        assemply{
           /*1*/
            PUSH1 8
            PUSH1 9
            PUSH1 5
            PUSH2 3
            PUSH2 4
            DUP1 
            LT
            POP
            /*2*/
            PUSH1 6
            PUSH1 10
            LT
            /*3*/
            PUSH1 9
            PUSH1 3
            LT
            /*4*/
            PUSH2 2
            PUSH1 4
            PUSH2 7
            PUSH1 3
            DUP2
            LT

        }
    }
}

