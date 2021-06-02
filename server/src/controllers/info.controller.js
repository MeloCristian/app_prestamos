const pool = require('../database');

class InfoController {  
    async getSedes() {
        try {
            const sedes = await pool.query('SELECT * FROM sedes');
            return sedes.rows;
        } catch( error ) {
            console.log(error);
            return {'error': "Error al obtener las sedes disponibles"};
        }
    }

    async getFuncionarios() {
        try {
            const funcionarios = await pool.query('SELECT * FROM funcionarios');
            return funcionarios.rows;
        } catch( error ) {
            console.log(error);
            return {'error': "Error al obtener la información de los funcionarios"};
        }
    }
}

const infoController = new InfoController();
module.exports = infoController;