include "../util/number.dfy"
include "../util/math.dfy"
module Lending{
    import opened Number;
    import opened Math;
    //יחס הניצול -היחס שהוא לוקח בהתאם למשיכה מהבריכה 
    function utilzationRatio(borrow:real,deposit:real):bool
    requires deposit!=0.0
    ensures utilzationRatio(borrow,deposit)==(borrow/deposit<=0.08)
    {
        borrow/deposit<=0.8
    }
    function interestMult(utilzationRatio:real,baseRate:real,annualBorrow:real):real
    requires utilzationRatio!=0.0
    ensures interestMult(utilzationRatio,baseRate,annualBorrow:real)==((annualBorrow/baseRate)/utilzationRatio >)
    {

    }
}