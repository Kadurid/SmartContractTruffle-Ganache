pragma solidity ^0.5.0;

contract Compra {
  address[16] public compradores;

  function comprar(uint movelId)public returns (uint) {
    require(movelId >=0 && movelId <=15);

    compradores[movelId] = msg.sender;

    return movelId;
  }

  function getCompradores() public view returns(address[16] memory){
    return compradores;
  }
}