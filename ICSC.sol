pragma solidity ^0.4.25;
pragma experimental ABIEncoderV2;

contract log_integrity{

 mapping(uint=>mapping(uint=>mapping(uint=>string))) loghash;
 
 function put_loghash(uint d_id, uint s_id,  uint eqid, string hash  ) public {
        loghash[s_id][eqid][d_id]= hash;
    }
  function get_loghash(uint s_id, uint d_id,  uint eqid) public view
        returns (string){
        return loghash[s_id][eqid][d_id];
    }

}
