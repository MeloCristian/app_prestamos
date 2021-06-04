const { Router } = require('express');
const router = Router();

// Controller
const prestamosController = require('../controllers/prestamos.controller');
const { verifyToken } = require('../helpers/jwt');

// configuracion y creacion del upload multer
const { createMulterUpload } = require('../helpers/multer');
const upload = createMulterUpload('prestamo');


// ENPOINTS

router.get('/:qr', prestamosController.getPrestamos);

// Realizar un prestamo
router.post('/', verifyToken, upload.single('archivo_pdf'), async (req, res) => {        
    
    // const prestamo = await prestamosController.createPrestamo(req.body);
    const comodato = await prestamosController.setComodatoPrestamo( req.body );
    const prestamo = await prestamosController.getPrestamo(req.body.id_prestamo);
    
    if(!prestamo.error) {
        res.json(prestamo);
    } else {
        res.status(400).json(prestamo);
    }
});

// Cargar comodato
router.put('/', verifyToken, upload.single('archivo_pdf'), async (req, res) => {        
    
    try {
        const result = await prestamosController.setComodatoPrestamo(req.body);
        if(!result.error) {
            res.json(result);
        } else {
            res.status(400).json(prestamo);
        }
    } catch(e) {
        res.status(400).json({error: 'Error al actualizar el comodato. Inténtelo más tarde'});
    }

});

module.exports = router;