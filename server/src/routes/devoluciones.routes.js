const { Router } = require('express');
const router = Router();

const registrosController = require('../controllers/registros.controller');
const prestamosController = require('../controllers/prestamos.controller');

// configuracion y creacion del upload multer
const { createMulterUpload } = require('../helpers/multer');
const { verifyToken } = require('../helpers/jwt');
const upload = createMulterUpload('devolucion');

router.get('/', (req, res) => {
    res.json('error');
});

// Realizar un registro de (Garantía - Revisión) o Devolución
router.post('/', verifyToken, upload.single('archivo_pdf'), async (req, res) => {        

    const devolucion = await registrosController.createDevolucion( req.body );
    if(!devolucion.error) {
        res.json(devolucion);
    } else {
        res.status(400).json(devolucion);
    }

});

router.put('/', verifyToken, upload.single('archivo_pdf'), async (req, res) => {        

    const devolucion = await registrosController.terminarRegistro( req.body );
    if(!devolucion.error) {
        const finalizacion = await prestamosController.finalizarPrestamo( req.body )
        if( !finalizacion.error ) {
            res.json({
                devolucion,
                finalizacion
            });
        } else {
            res.status(400).json({
                devolucion,
                finalizacion
            });
        }
    } else {
        res.status(400).json(devolucion);
    }

});

module.exports = router;