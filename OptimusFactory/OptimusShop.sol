pragma solidity ^0.4.24;

import "./OptimusERC20.sol";
import "./OptimusCrowdsale.sol";
import "./Ownable.sol";

contract OptimusShop is Ownable  {

  OptimusERC20 public _token;
  OptimusCrowdsale public _crowdsale;
  uint256 public endtime;
  
  constructor( 
    
    ) public { 
        
       
    }
    function initializeShop(
        string name, 
        string symbol, 
        uint8 decimals, 
        uint256 cap,
        uint256 rate,
        address wallet,
        uint256 goal_in_eth,
        uint256 openingtime,
        uint256 closingtime 
    ) public onlyOwner {
        
        require(_token == address (0x00));
        require(_crowdsale == address (0x00));
        
        _token = new OptimusERC20();
        _token.Initialize(name,symbol,decimals,cap);
        endtime = now + 10 minutes;
        _crowdsale = new OptimusCrowdsale(rate,wallet,_token,goal_in_eth,0,endtime);
        // _crowdsale.Initialize(rate,wallet,_token,goal_in_eth,now,now + 10 minutes)
        _token.addMinter(address(_crowdsale));
    }


}  