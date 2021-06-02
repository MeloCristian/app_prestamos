const { Router } = require('express');
const router = Router();

const registrosController = require('../controllers/registros.controller');

// configuracion y creacion del upload multer
const { createMulterUpload } = require('../helpers/multer');
const upload = createMulterUpload('revision');

router.get('/', (req, res) => {
    res.json('error');
});

// Realizar un registro de (Garantía - Revisión) o Devolución
router.post('/', upload.single('archivo_pdf'), async (req, res) => {        

    // Cuando llegua aqui, quiere decir que el archivo y el registro ya se crearon en la base de datos...
    // Entonces lo que se hace ahora es proceder a setear el campo pdf_soporte para el registro correspondiente
    // Del cual el id_registro se encuentra en el req.body ya seteado por que con el multer ya creamos el registro (pero sin el campo pdf_soporte)
    const revision = await registrosController.setPDFRevision( req.body );

    if(!revision.error) {
        res.json(revision);
    } else {
        res.status(400).json(revision);
    }

});

router.put('/', upload.single('archivo_pdf'), async (req, res) => {        

    const revision = await registrosController.terminarRegistro( req.body );
    if(!revision.error) {
            res.json(revision);
    } else {
        res.status(400).json(revision);
    }

});

module.exports = router;