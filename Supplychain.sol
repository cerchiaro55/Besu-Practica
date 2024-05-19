// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChain {
    // Estructura de datos para representar un producto
    struct Product {
        uint256 productId;
        string name;
        address owner;
        address[] history;
    }

    // Mapeo para almacenar los productos por su ID
    mapping(uint256 => Product) public products;

    // Evento emitido cuando se registra un nuevo producto
    event ProductRegistered(uint256 productId, string name, address owner);

    // Evento emitido cuando se transfiere la propiedad de un producto
    event ProductTransferred(uint256 productId, address from, address to);

    // Función para registrar un nuevo producto
    function registerProduct(uint256 _productId, string memory _name) public {
        require(products[_productId].productId == 0, "Product already registered");
        products[_productId] = Product(_productId, _name, msg.sender, new address[](0));
        emit ProductRegistered(_productId, _name, msg.sender);
    }

    // Función para transferir la propiedad de un producto
    function transferProduct(uint256 _productId, address _to) public {
        require(products[_productId].productId != 0, "Product not registered");
        require(products[_productId].owner == msg.sender, "You are not the owner of this product");
        
        products[_productId].owner = _to;
        products[_productId].history.push(msg.sender);
        
        emit ProductTransferred(_productId, msg.sender, _to);
    }

    // Función para obtener el historial de propiedad de un producto
    function getProductHistory(uint256 _productId) public view returns (address[] memory) {
        return products[_productId].history;
    }
}

