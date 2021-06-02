const pool = require('../database');

class RegistrosController {  
    async getRegistros(id_prestamo) {
        try {
            const registros = await pool.query(`
                SELECT 
                P.id_prestamo, P.qr, R.id_registro, R.fecha_inicio, R.fecha_fin, PR.id_proceso, PR.proceso, PR.descripcion, R.pdf_soporte
                FROM prestamos P INNER JOIN registros R ON P.id_prestamo = R.id_prestamo
                INNER JOIN procesos PR ON R.id_proceso = PR.id_proceso 
                WHERE R.id_prestamo = $1 OR P.qr = $1
            `, [ id_prestamo ]);
            return registros.rows;
        } catch( error ) {
            console.log(error);
            return {error: "Error al obtener los procesos realizados al equipo"};
        }
    }

    async getUltimoRegistro(id_prestamo) {
        try {
            const registros = await pool.query(`
                SELECT 
                P.id_prestamo, P.qr, R.id_registro, R.fecha_inicio, R.fecha_fin, PR.id_proceso, PR.proceso, PR.descripcion, R.pdf_soporte
                FROM prestamos P INNER JOIN registros R ON P.id_prestamo = R.id_prestamo
                INNER JOIN procesos PR ON R.id_proceso = PR.id_proceso 
                WHERE R.id_prestamo = $1 ORDER BY id_registro DESC LIMIT 1
            `, [ id_prestamo ]);
            return registros.rows;
        } catch( error ) {
            console.log(error);
            return {error: "Error al obtener el registro"};
        }
    }

    async createRevision({ id_prestamo, qr, fecha }) {
        try {
            // const pdf = `revision_${id_registro}_${qr}.pdf`;
            const revision = await pool.query(`
                INSERT INTO registros(id_prestamo, qr, fecha_inicio, id_proceso)
                VALUES ($1, $2, $3, $4)
            `, [ id_prestamo, qr, fecha, 1 ]);

            if(revision.rowCount > 0) {
                const ultimoRegistro = await this.getUltimoRegistro(id_prestamo);
                return ultimoRegistro[0];
            } else {
                return {error: "Error al registrar la revisión del equipo"};
            }
        } catch( error ) {
            console.log(error);
            return {error: "Error al registrar la revisión del equipo"};
        }
    }

    async setPDFRevision({ id_prestamo, id_registro, qr }) {
        try {
            const pdf = `revision_${id_registro}_${qr}.pdf`;

            const result = await pool.query(`
                UPDATE registros
                SET pdf_soporte = $1
                WHERE id_registro = $2;
            `, [ pdf, id_registro ]);

            if(result.rowCount > 0) {
                const ultimoRegistro = await this.getUltimoRegistro(id_prestamo);
                return ultimoRegistro[0];
            } else {
                return { error: "Error al registrar la revisión del equipo" };
            }
        } catch( error ) {
            console.log(error);
            return { 'error': 'Error al registrar la revisión del equipo' };
        }
    }

    async createDevolucion({ id_prestamo, qr, fecha }) {
        try {
            const pdf = `devolucion_${id_prestamo}_${qr}.pdf`;

            const devolucion = await pool.query(`
                INSERT INTO registros(id_prestamo, qr, fecha_inicio, id_proceso, pdf_soporte)
                VALUES ($1, $2, $3, $4, $5);
            `, [ id_prestamo, qr, fecha, 2, pdf ]);

            if(devolucion.rowCount > 0) {
                const ultimoRegistro = await this.getUltimoRegistro(id_prestamo);
                return ultimoRegistro[0];
            } else {
                return {error: "Error al registrar la devolución del equipo"};
            }
        } catch( error ) {
            console.log(error);
            return {error: "Error al registrar la devolución del equipo"};
        }
    }

    async terminarRegistro({ id_registro, fecha }) {
        try {
            const result = await pool.query(`
                UPDATE public.registros
                SET fecha_fin = $1
                WHERE id_registro = $2;
            `, [ fecha, id_registro ]);

            if(result.rowCount > 0) {
                return { 'message': 'Se ha finalizado el registro correctamente' };
            } else {
                return { 'error': 'Error al finalizar el registro' };
            }
        } catch( error ) {
            console.log(error);
            return { 'error': 'Error al finalizar el registro' };
        }
    }
}

const registrosController = new RegistrosController();
module.exports = registrosController;