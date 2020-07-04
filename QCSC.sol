pragma solidity ^0.4.25;
pragma experimental ABIEncoderV2;

contract QoS_Advertisements{
 
 // INTER DOMAIN LINK ADD AND RETRIEVAL ############################################################3  
        struct inter_domain_link {
        uint neighbor_id;
        uint entry_switch_id;
        uint exit_switch_id;     
        string QoS; //QoS values separated by comma in the order bw, delay, price ex: "{'bw':20,'d':10,'c':10}"
    }

    mapping (uint => inter_domain_link[]) public inter_QoS_offers; // mapping of domains to their QoS offers of inter domain links
   
    function add_inter_domain_QoS_offers (uint id, uint neighbor_id, uint entry_switch_id, uint exit_switch_id, string QoS) public {
        inter_QoS_offers[id].push(inter_domain_link(neighbor_id,entry_switch_id,exit_switch_id,QoS));
    }

    function get_length_of_inter_QoS_offers(uint id) public view returns (uint) {
        return inter_QoS_offers[id].length;
    }
    
   function get_inter_QoS_paths(uint id, uint[] indexes) // passing id and the array of indexes to fetch arrays of QoS_paths
        public view
        returns (uint[], uint[], uint[], string[])
    {
        uint[] memory neighbor_id = new uint[](indexes.length);
        uint[] memory entry_switch_id = new uint[](indexes.length);
        uint[] memory exit_switch_id = new uint[](indexes.length);
        string[] memory QoS = new string[](indexes.length);
        
        
        for (uint i = 0; i < indexes.length; i++) {
            inter_domain_link storage t1 = inter_QoS_offers[id][indexes[i]];
            neighbor_id[i] = t1.neighbor_id;
            entry_switch_id[i] = t1.entry_switch_id;
            exit_switch_id[i] = t1.exit_switch_id;
            QoS[i] = t1.QoS;
        }
        
        return (neighbor_id,entry_switch_id, exit_switch_id,QoS);
    }
   //  INTRA DOMAIN LINK ADD AND RETRIEVE ###################################################################### 
   
   struct intra_domain_link {
       uint entry_switch_id;
        uint exit_switch_id;     
        string QoS; //QoS values separated by comma in the order bw, delay, price
    }

    mapping (uint => intra_domain_link[]) public intra_QoS_offers; // mapping of domains to their QoS offers of intra domain links
   
    function add_intra_domain_QoS_offers (uint id, uint entry_switch_id, uint exit_switch_id, string QoS) public {
        intra_QoS_offers[id].push(intra_domain_link(entry_switch_id,exit_switch_id,QoS));
    }

    function get_length_of_intra_QoS_offers(uint id) public view returns (uint) {
        return intra_QoS_offers[id].length;
    }
    
   function get_intra_QoS_paths(uint id, uint[] indexes) // passing id and the array of indexes to fetch arrays of QoS_paths
        public view
        returns (uint[], uint[], string[])
    {
        uint[] memory entry_switch_id = new uint[](indexes.length);
        uint[] memory exit_switch_id = new uint[](indexes.length);
        string[] memory QoS = new string[](indexes.length);

        for (uint i = 0; i < indexes.length; i++) {
            intra_domain_link storage t1 = intra_QoS_offers[id][indexes[i]];
            entry_switch_id[i] = t1.entry_switch_id;
            exit_switch_id[i] = t1.exit_switch_id;
            QoS[i] = t1.QoS;
        }

        return (entry_switch_id, exit_switch_id,QoS);
    }
}
