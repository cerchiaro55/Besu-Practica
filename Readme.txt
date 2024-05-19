# Contrato Inteligente de Cadena de Suministro y Scripts de Despliegue

Este repositorio contiene un contrato inteligente de cadena de suministro simple desarrollado en Solidity, así como scripts de despliegue para desplegar el contrato en las redes de Besu y Teku.

## Contrato Inteligente

El contrato inteligente, llamado `SupplyChain.sol`, proporciona una implementación básica de una cadena de suministro en la blockchain. Permite la trazabilidad de productos a lo largo de la cadena de suministro mediante las siguientes funciones:

- `registerProduct(uint256 _productId, string memory _name)`: Registra un nuevo producto en la cadena de suministro.
- `transferProduct(uint256 _productId, address _to)`: Transfiere la propiedad de un producto a otro participante de la cadena de suministro.
- `getProductHistory(uint256 _productId)`: Obtiene el historial de propiedad de un producto.

## Despliegue en Besu

El script de despliegue para Besu, `deployBesu.js`, utiliza la biblioteca web3.js para conectarse a la red de Besu y desplegar el contrato inteligente. Antes de ejecutar el script, asegúrate de tener una instancia de Besu en funcionamiento y ajusta la dirección de la cuenta desde la cual desplegar el contrato.

Ejecuta el script de despliegue con el siguiente comando:

```bash
node deployBesu.js

