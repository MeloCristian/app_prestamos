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
    
    const { id_prestamo, qr, dni_estudiante } = req.body;
    
    fotoName = `${qr}_${dni_estudiante}_${id_prestamo}.png`;

    // Guardo la evidencia en la carpeta correspondiente, convirtiendo la img64 a archivo de imagen png
    let base64Data = req.body.data_img.replace(/^data:image\/png;base64,/, "");
    base64Data = base64Data.replace(/^data:image\/jpeg;base64,/, "");
    
    require("fs").writeFile(__dir+"/soportes/evidencias/"+fotoName, base64Data, 'base64', (err) => {
        if(err)
            console.log('error');
    });

    const comodato = await prestamosController.setComodatoPrestamo( req.body );
    const evidencia = await prestamosController.setEvidenciaPrestamo( req.body );
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
            res.status(400).json(result);
        }
    } catch(e) {
        res.status(400).json({error: 'Error al actualizar el comodato. Inténtelo más tarde'});
    }

});

// Cargar evidencia
router.put('/evidencia', verifyToken, async (req, res) => {
    
    try {
        const result = await prestamosController.setEvidenciaPrestamo( req.body );
        if(!result.error) {

            const { id_prestamo, qr, dni_estudiante } = req.body;

            fotoName = `${qr}_${dni_estudiante}_${id_prestamo}.png`;

            // Guardo la evidencia en la carpeta correspondiente, convirtiendo la img64 a archivo de imagen png
            let base64Data = req.body.data_img.replace(/^data:image\/png;base64,/, "");
            base64Data = base64Data.replace(/^data:image\/jpeg;base64,/, "");
            
            require("fs").writeFile(__dir+"/soportes/evidencias/"+fotoName, base64Data, 'base64', (err) => {
                if(err)
                    console.log('error');
            });
            
            res.json(result);
            
        } else {
            res.status(400).json(result);
        }
    } catch(e) {
        res.status(400).json({error: 'Error al actualizar la evidencia. Inténtelo más tarde'});
    }

});

module.exports = router;