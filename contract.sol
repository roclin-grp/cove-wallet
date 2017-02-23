pragma solidity 0.4.8;

contract MyToken {
        mapping (address => uint256) public balanceOf;
        string public name;
        string public symbol;
        uint8 public decimal;
        event Transfer(address indexed from, address indexed to, uint256 value);
    /* Constructor */
    function MyToken(uint256 initialSupply, string tokenName, string tokenSymbol, uint8 decimalUnit) {
        balanceOf[msg.sender] = initialSupply;
        name = tokenName;
        symbol = tokenSymbol;
        decimal = decimalUnit;
    }
    function transfer(address _to, uint256 _value){
        /*Validations*/
        if(balanceOf[msg.sender] < _value || balanceOf[_to] + _value < balanceOf[_to]){
            throw;
        }
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        /*Notification that transfer took place*/
        Transfer(msg.sender, _to, _value);
    }
}