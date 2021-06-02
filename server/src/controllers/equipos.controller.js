const pool = require('../database');

class EquiposController {

    async getOne(qr) {
        try {
            const equipo = await pool.query(`
            SELECT E.qr, E.garantia, E.sn, E.sn_disco1, E.sn_disco2, 
            S.sede as sede_responsable,  
            L.id_lote, L.marca, L.modelo, L.cpu, L.ram, L.hdd 
            FROM equipos E INNER JOIN sedes S ON E.sede_responsable = S.id_sede 
            INNER JOIN lotes L ON E.id_lote = L.id_lote 
            WHERE E.qr = $1 OR E.sn = $2 LIMIT 1
            `, [ parseInt(qr), qr.toString() ]);
            return equipo.rows;
        } catch( error ) {
            console.log(error);
            return {'error': "Error al consultar el equipo"};
        }
    }

    async getTotalEquipos() {
        try {
            const equipos = await pool.query('SELECT count(*) AS equipos FROM equipos');
            return equipos.rows[0]['equipos'];
        } catch( error ) {
            console.log(error);
            return { error: "Error al obtener el total de equipos"};
        }
    }

    async getTotalPrestamos() {
        try {
            const prestamos = await pool.query('SELECT count(*) AS prestamos FROM prestamos');
            return prestamos.rows[0]['prestamos'];
        } catch( error ) {
            console.log(error);
            return { error: "Error al obtener el numero de préstamos realizados"};
        }
    }

    async getTotalDisponibles() {
        try {
            const disponibles = await pool.query('SELECT count(qr) AS disponibles FROM equipos WHERE NOT qr IN (SELECT QR from prestamos WHERE fecha_fin IS NULL)');
            return disponibles.rows[0]['disponibles'];
        } catch( error ) {
            console.log(error);
            return { error: "Error al obtener el total de equipos disponibles"};
        }
    }

    async getTotalRevisiones() {
        try {
            const revisiones = await pool.query('SELECT count(*) AS revisiones FROM registros WHERE id_proceso = 1');
            return revisiones.rows[0]['revisiones'];
        } catch( error ) {
            console.log(error);
            return { error: "Error al obtener el total de revisiones realizadas"};
        }
    }

    async getTotalDevoluciones() {
        try {
            const devoluciones = await pool.query('SELECT count(*) AS devoluciones FROM registros WHERE id_proceso = 2 AND fecha_fin IS NOT NULL');
            return devoluciones.rows[0]['devoluciones'];
        } catch( error ) {
            console.log(error);
            return { error: "Error al obtener el total de devoluciones"};
        }
    }
}

const equiposController = new EquiposController();
module.exports = equiposController;