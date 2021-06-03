const pool = require('../database');

class InfoController {  
    async getSedes() {
        try {
            const sedes = await pool.query('SELECT * FROM sedes');
            return sedes.rows;
        } catch( error ) {
            console.log(error);
            return { error: 'Error al obtener las sedes disponibles' };
        }
    }

    async getFuncionarios() {
        try {
            const funcionarios = await pool.query('SELECT * FROM funcionarios');
            return funcionarios.rows;
        } catch( error ) {
            console.log(error);
            return { error: 'Error al obtener la información de los funcionarios'};
        }
    }

    async getComodatario( dni ) {
        try {
            const comodatario = await pool.query('SELECT nombre FROM comodatarios WHERE cedula = $1 LIMIT 1', [ dni ]);
            console.log(comodatario.rows);
            if(comodatario.rowCount > 0) {
                return comodatario.rows[0];
            } else {
                return { error: 'Estudiante no registrado en la base de datos' };
            }
        } catch( error ) {
            console.log(error);
            return { error: 'Estudiante no registrado en la base de datos' };
        }
    }
}

const infoController = new InfoController();
module.exports = infoController;