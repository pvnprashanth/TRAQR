pragma solidity ^0.4.25;
pragma experimental ABIEncoderV2;
contract registration{
    struct domain {
        uint id; //AS Number
        string eth_address; //blockchain address
        string public_key; //public key
    }
    domain[] public domain_values; //domain_values is an array of domains
    which are structs
    function add_domain_values(uint domain_id, string domain_eth_address, 
    string pub_key ) public {
        domain_values.length++;
        domain_values[domain_values.length-1].id = domain_id;
        domain_values[domain_values.length-1].eth_address = domain_eth_address;
        domain_values[domain_values.length-1].public_key = pub_key;
    }
    function get_length_of_domain_values() public view returns (uint){
        return domain_values.length;
    }
    function get_domain_values(uint[] indexes) // passing array of indexes
    to fetch arrays of domain values
        public view
        returns (uint[], string[], string[])
    {
        uint[] memory id = new uint[](indexes.length);
        string[] memory eth_address = new string[](indexes.length);
        string[] memory pub_key = new string[](indexes.length);
        for (uint i = 0; i < indexes.length; i++) {
            domain storage t1 = domain_values[indexes[i]];
            id[i] = t1.id;
            eth_address[i] = t1.eth_address;
            pub_key[i] = t1.public_key;
        }
        return (id,eth_address,pub_key);
    }}
