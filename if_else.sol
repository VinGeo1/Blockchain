//SPDX-licnese-Identifier:MIT
pragma solidity ^0.5.7;

contract ifElse{
    //declare state variable 
    uint i=10;
    string result;

    function decision()public returns(string memory){
        if(i<10){
            result ="less than 10";
        }else if(i==10){
            result ="equal to 10";
        }else {
            result="greater than 10";
        }
        return result;
    }
    function callMe()public pure returns(uint){
        return 100;
    }
    function ternaryTest(uint _val) public pure returns(uint){
        uint testValue =(_val==0)?callMe():200;
        return testValue;
    }
    //function can return mutiple values
    function returnMany() public pure returns(uint,bool,uint){
    return(1,true,99);
    }

    //return values can also be assigned ti their names.
    //Note:the return statement can be omitted in this case!
    function assigned() public pure returns(uint x, bool b,uint y){
        x=1;
        b=true;
        y=777;
    }
    function callAssigned()public pure{
     (uint x,bool a2,uint y) = assigned();
    }

    function continueAndBreak() public pure{
        for(uint z=0;z<10;z++){
            if(z==4){
            //skip to the next iteration of the loop
             continue;
            }
            if(z==7){
                //break out of the for loop
                break;
            }
        }
    }
}
