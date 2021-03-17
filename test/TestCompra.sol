pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Compra.sol";

contract TestCompra {
  Compra compra = Compra(DeployedAddresses.Compra());

  uint expectedMovelID = 8;

  address expectedComprador = address(this);

  function testUserCanComprar() public{
    uint returnedId = compra.comprar(expectedMovelID);

    Assert.equal(returnedId,expectedMovelID, "Compra do imovel esperado deve equivaler ao que foi retornado");
  }
  function testGetCompradorAddressByImovelId() public{
    address comprador = compra.compradores(expectedMovelID);

    Assert.equal(comprador, expectedComprador, "Dono do Imovel esperado deve estar neste contrato");
  }
  function testGetCompradorAddressByImovelIdInArray() public{
    address[16] memory compradores = compra.getCompradores();

    Assert.equal(compradores[expectedMovelID], expectedComprador, "Dono do Imovel esperado deve estar neste contrato");
  }
}