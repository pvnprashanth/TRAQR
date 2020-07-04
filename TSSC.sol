
//Trust Score Smart Contract s_id, p_id are source and provider domain ids
pragma solidity ^0.4.25;
pragma experimental ABIEncoderV2;

contract trust_scores{

    struct scores {
        uint s_id;
        uint p_id;
        uint score; //score range [0,1] scaled by 10 to get integer value.
    }
    
    scores[] public trust_values; //trust_values is an array of domains which are structs

    function add_domain_values(uint s_id, uint p_id, uint score) public {
        trust_values.length++;
        trust_values[trust_values.length-1].s_id = s_id;
        trust_values[trust_values.length-1].p_id = p_id;
        trust_values[trust_values.length-1].score = score;
    }
    
    function get_length_of_domain_values() public view returns (uint){
        return trust_values.length;
    }
    
    function get_domain_values(uint[] indexes) // passing array of indexes to fetch arrays of domain values
        public view
        returns (uint[], uint[], uint[])
    {
        uint[] memory s_id = new uint[](indexes.length);
        uint[] memory p_id = new uint[](indexes.length);
        uint[] memory score = new uint[](indexes.length);
        
        for (uint i = 0; i < indexes.length; i++) {
            scores storage t1 = trust_values[indexes[i]];
            s_id[i] = t1.s_id;
            p_id[i] = t1.p_id;
            score[i] = t1.score;
            }
        
        return (s_id,p_id,score);
    }}
    
