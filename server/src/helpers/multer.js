const multer = require('multer');

const registroController = require('../controllers/registros.controller');

const setStorageMulter = (destino, accion) => {
    return multer.diskStorage({
        destination: (req, file, cb) => {
            cb(null, destino);
        },
        filename: async (req, file, cb) => {
            
            const { id_prestamo, qr, dni_estudiante } = req.body;
            
            let fileName = '';
            if(accion == 'prestamo') fileName = `${qr}_${dni_estudiante}.pdf`;
            if(accion == 'devolucion') fileName = `devolucion_${id_prestamo}_${qr}.pdf`;
            if(accion == 'revision') {
                // Si no existe el parametro id_registro, quiere decir que va a iniciar un registro entonces hago lo siguiente:
                if(!req.body.id_registro) {
                    // Para el caso de las revisiones, lo que debo hacer es hacer la creación de la revisión sin el campo pdf_soporte
                    // Después tomar el id_registro de ese registro insertado y...
                    // Ponerlo en el nombre del archivo para evitar que los soportes anteriores se pierdan
                    // Finalmente ese id_registro lo pongo en el req.body para poder actualizar el campo pdf_soporte...
                    // Revisar el archivo revisiones.routes.js en el metodo post para continuar y entender lo que se hace
                    const registro = await registroController.createRevision( req.body );
                    req.body.id_registro = registro['id_registro'];
                    fileName = `revision_${registro['id_registro']}_${qr}.pdf`;
                } else {
                    // Si existe el parametro id_registro, entonces simplemente agrego el archivo con el nombre correspondiente
                    fileName = `revision_${req.body.id_registro}_${qr}.pdf`;
                }
            }

            cb(null , fileName);
        }
    });
}

module.exports.createMulterUpload = ( accion ) => {
    let destino = '';

    if(accion == 'prestamo') {
        destino = __dir + '/soportes/comodatos/'
    } else if(accion == 'revision'){
        destino = __dir + '/soportes/revisiones/'
    } else {
        destino = __dir + '/soportes/devoluciones/'
    }

    return multer( { storage : setStorageMulter(destino, accion) } );
}
