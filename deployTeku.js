const Web3 = require('web3');
const fs = require('fs');

// Conexión a la red de Teku
const web3 = new Web3('http://localhost:8545'); // Asegúrate de utilizar el puerto correcto

// Cargar el contrato inteligente
const contractData = JSON.parse(fs.readFileSync('SupplyChain.json', 'utf8')); // Asegúrate de que el archivo JSON tenga la información del contrato

// Crear el objeto del contrato
const contract = new web3.eth.Contract(contractData.abi);

// Definir la cuenta desde la cual desplegar el contrato
const account = '0x1234567890123456789012345678901234567890'; // Dirección de la cuenta desde la cual desplegar el contrato

// Desplegar el contrato
contract.deploy({
    data: contractData.bytecode
})
.send({
    from: account,
    gas: 1500000, // Ajusta el límite de gas según sea necesario
    gasPrice: '30000000000000' // Ajusta el precio del gas según sea necesario
})
.then((newContractInstance) => {
    console.log('Contrato desplegado en la dirección: ', newContractInstance.options.address);
});



