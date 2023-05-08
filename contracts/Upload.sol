// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Upload
{ 
    struct Acess{
        address user;
        bool check;
    }
     Acess a1 ;
    mapping(address=>string[])images;
    mapping(address=>Acess[])List;
    mapping(address=>mapping(address=>bool))ownership;
    mapping(address=>mapping(address=>bool))previous_data;

    function add(address user,string memory url) external {
     images[user].push(url);
    }
    function give_access(address main,address user) external
    {

     if(ownership[main][user]==false)
     {
         main=msg.sender;
        ownership[main][user]=true;
       if(previous_data[main][user]==false)
       {
        a1 =Acess(user,true);
        List[main].push(a1);
       }
       previous_data[main][user]=true;
       for(uint i=0;i<List[main].length;i++)
        {
           if(List[main][i].user==user)
           {
               List[main][i].check=true;
               break;
           }
        }
    
     } 

    }
    function remove_Access(address main,address user) external
    {
        main=msg.sender;
       if(ownership[main][user]==true)
     {
        ownership[main][user]=false;
        for(uint i=0;i<List[main].length;i++)
        {
           if(List[main][i].user==user)
           {
               List[main][i].check=false;
               break;
           }
        }
     } 
    }
   function display(address user) external view returns(string[] memory )
   {
        require(msg.sender==user|| ownership[user][msg.sender],"you dont have access to these thing");
        return images[user];
   }
   function share_Access() public view returns (Acess[] memory)
   {
       return List[msg.sender];
   }

}