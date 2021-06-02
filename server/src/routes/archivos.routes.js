const { Router } = require('express');
const router = Router();
const fs = require('fs');

router.get('/', (req,res) => {
    // Page not found
    // res.send('<h1>Error</h1>');
    // res.status(404);
    res.sendStatus(404);
});

const archivoExiste = (archivo) => {
    try {
        if(fs.existsSync(archivo)) {
            return true;
        } else {
            return false;
        }
    } catch (e) {
        return false;
    } 
}

router.get('/comodatos/:pdf', (req,res) => {
    const { pdf } = req.params;
    const archivo = `${__dir}/soportes/comodatos/${pdf}`;
    if(archivoExiste(archivo)) {
        return res.sendFile(archivo);
    } else {
        res.status(400).json({ 'error': 'El archivo solicitado no existe' });
    }
});

router.get('/revisiones/:pdf', (req,res) => {
    const { pdf } = req.params;
    const archivo = `${__dir}/soportes/revisiones/${pdf}`;
    if(archivoExiste(archivo)) {
        return res.sendFile(archivo);
    } else {
        res.status(400).json({ 'error': 'El archivo solicitado no existe' });
    }
});

router.get('/devoluciones/:pdf', (req,res) => {
    const { pdf } = req.params;
    const archivo = `${__dir}/soportes/devoluciones/${pdf}`;
    if(archivoExiste(archivo)) {
        return res.sendFile(archivo);
    } else {
        res.status(400).json({ 'error': 'El archivo solicitado no existe' });
    }
});

module.exports = router; 