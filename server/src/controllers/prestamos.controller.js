const pool = require('../database');

class PrestamosController {  
    async getPrestamos(qr) {
        try {
            // const { qr } = req.params;
            
            const prestamos = await pool.query(`
                SELECT 
                E.qr, CE.cedula as cedula_estudiante, CE.nombre as estudiante, CE.codigo, C.nombre, 
                F.cedula as cedula_funcionario, F.nombre as funcionario,
                P.id_prestamo, P.comodato, P.fecha_inicio, P.fecha_fin, P.evidencia,
                S.sede as lugar_prestamo
                FROM equipos E INNER JOIN prestamos P ON E.qr = P.qr 
                INNER JOIN comodatarios CE ON P.dni_comodatario = CE.cedula 
                INNER JOIN carreras C ON C.cod_carrera = CE.cod_carrera 
                INNER JOIN funcionarios F ON P.dni_funcionario = F.cedula
                INNER JOIN sedes S ON P.lugar_prestamo = S.id_sede
                WHERE P.qr = $1 OR CE.cedula = $1 OR CE.codigo = $1 ORDER BY P.id_prestamo DESC
            `, [ qr ]);
            // res.json(equipos.rows);
            return prestamos.rows;
        } catch( error ) {
            console.log(error);
            // res.status(400).json({'error': "Error al obtener los prestamos del equipo"});
            return {'error': "Error al obtener los prestamos del equipo"};
        }
    }

    async getPrestamo(id_prestamo) {
        try {
            // const { qr } = req.params;
            
            const prestamos = await pool.query(`
                SELECT 
                E.qr, CE.cedula as cedula_estudiante, CE.nombre as estudiante, CE.codigo, C.nombre, 
                F.cedula as cedula_funcionario, F.nombre as funcionario,
                P.id_prestamo, P.comodato, P.fecha_inicio, P.fecha_fin, P.evidencia,
                S.sede as lugar_prestamo
                FROM equipos E INNER JOIN prestamos P ON E.qr = P.qr 
                INNER JOIN comodatarios CE ON P.dni_comodatario = CE.cedula 
                INNER JOIN carreras C ON C.cod_carrera = CE.cod_carrera 
                INNER JOIN funcionarios F ON P.dni_funcionario = F.cedula
                INNER JOIN sedes S ON P.lugar_prestamo = S.id_sede
                WHERE P.id_prestamo = $1
            `, [ id_prestamo ]);
            // res.json(equipos.rows);
            return prestamos.rows[0];
        } catch( error ) {
            console.log(error);
            // res.status(400).json({'error': "Error al obtener los prestamos del equipo"});
            return {'error': "Error al obtener el prestamo del equipo"};
        }
    }

    async getUltimoPrestamo(qr) {
        try {
            // const { qr } = req.params;
            
            const prestamos = await pool.query(`
                SELECT 
                E.qr, CE.cedula as cedula_estudiante, CE.nombre as estudiante, CE.codigo, C.nombre, 
                F.cedula as cedula_funcionario, F.nombre as funcionario,
                P.id_prestamo, P.comodato, P.fecha_inicio, P.fecha_fin, 
                S.sede as lugar_prestamo
                FROM equipos E INNER JOIN prestamos P ON E.qr = P.qr 
                INNER JOIN comodatarios CE ON P.dni_comodatario = CE.cedula 
                INNER JOIN carreras C ON C.cod_carrera = CE.cod_carrera 
                INNER JOIN funcionarios F ON P.dni_funcionario = F.cedula
                INNER JOIN sedes S ON P.lugar_prestamo = S.id_sede
                WHERE P.qr = $1 OR CE.cedula = $1 OR CE.codigo = $1 ORDER BY P.id_prestamo DESC LIMIT 1
            `, [ qr ]);
            // res.json(equipos.rows);
            return prestamos.rows;
        } catch( error ) {
            console.log(error);
            // res.status(400).json({'error': "Error al obtener los prestamos del equipo"});
            return {'error': "Error al obtener el prestamo del equipo"};
        }
    }

    async createPrestamo({ qr, dni_estudiante, dni_funcionario, fecha_inicio, lugar_prestamo }) {
        try {
            // const { qr } = req.params;
            const prestamo = await pool.query(`
                INSERT INTO prestamos(qr, dni_comodatario, dni_funcionario, fecha_inicio, lugar_prestamo)
                VALUES ($1, $2, $3, $4, $5) RETURNING id_prestamo
            `, [ qr, dni_estudiante, dni_funcionario, fecha_inicio, lugar_prestamo]);

            if(prestamo.rowCount > 0) {
                const ultimoPrestamo = await this.getUltimoPrestamo(qr);
                return ultimoPrestamo[0];
            } else {
                return {'error': "Error al obtener los prestamos del equipo"};
            }
        } catch( error ) {
            console.log(error);
            // res.status(400).json({'error': "Error al obtener los prestamos del equipo"});
            return {'error': "Error al realizar el préstamo del equipo"};
        }
    }

    async setComodatoPrestamo({ id_prestamo, qr, dni_estudiante }) {
        try {
            // const { qr } = req.params;
            const comodato = `${qr}_${dni_estudiante}_${id_prestamo}.pdf`;

            const result = await pool.query(`
                UPDATE prestamos
                SET comodato = $1
                WHERE id_prestamo = $2 AND qr = $3;
            `, [ comodato, id_prestamo, qr]);

            if(result.rowCount > 0) {
                return {'message': "Comodato cargado y actualizado correctamente"};
            } else {
                return {'error': "Error al actualizar el comodato"};
            }
        } catch( error ) {
            console.log(error);
            return {'error': "Error al actualizar el comodato"};
        }
    }

    async setEvidenciaPrestamo({ id_prestamo, qr, dni_estudiante }) {
        try {
            // const { qr } = req.params;
            const evidencia = `${qr}_${dni_estudiante}_${id_prestamo}.png`;

            const result = await pool.query(`
                UPDATE prestamos
                SET evidencia = $1
                WHERE id_prestamo = $2 AND qr = $3;
            `, [ evidencia, id_prestamo, qr]);

            if(result.rowCount > 0) {
                return {'message': "Evidencia cargada y actualizada correctamente"};
            } else {
                return {'error': "Error al actualizar la evidencia"};
            }
        } catch( error ) {
            console.log(error);
            return {'error': "Error al actualizar la evidencia"};
        }
    }

    async finalizarPrestamo({ id_prestamo, fecha }) {
        try {
            const result = await pool.query(`
                UPDATE prestamos
                SET fecha_fin = $1
                WHERE id_prestamo = $2
            `, [ fecha, id_prestamo]);

            if(result.rowCount > 0) {
                return {'message': "Préstamo finalizado correctamente"};
            } else {
                return {'error': "Error al finzalizar el préstamo"};
            }
        } catch( error ) {
            console.log(error);
            return {'error': "Error al finzalizar el préstamo"};
        }
    }
}

const prestamosController = new PrestamosController();
module.exports = prestamosController;