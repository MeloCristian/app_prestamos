const { Router } = require('express');
const router = Router();

// Controllers
const equiposController = require('../controllers/equipos.controller');
const prestamosController = require('../controllers/prestamos.controller');
const registrosController = require('../controllers/registros.controller');

const infoController = require('../controllers/info.controller');

router.get('/summary', async (req, res) => {

    const equipos = await equiposController.getTotalEquipos();
    const prestamos = await equiposController.getTotalPrestamos();
    const disponibles = await equiposController.getTotalDisponibles();
    const revisiones = await equiposController.getTotalRevisiones();
    const devoluciones = await equiposController.getTotalDevoluciones();

    res.json({
        equipos,
        prestamos,
        disponibles,
        revisiones,
        devoluciones
    });
});

router.get('/info', async (req, res) => {
    const sedes = await infoController.getSedes();
    const funcionarios = await infoController.getFuncionarios();
    res.json({
        sedes,
        funcionarios
    });
});

router.get('/:qr', async (req, res) => {
    // Obtengo la información del equipo
    // Obtengo los prestamos que tiene el equipo
    // Obtengo los registros que se han hecho al equipo (Revisiones, garantias o devoluciones)

    let { qr } = req.params;
    const informacion = await equiposController.getOne(qr);

    if(informacion.length) {
        if(qr != informacion[0].qr) {
            qr = informacion[0].qr;
        }
    }

    const prestamos = await prestamosController.getPrestamos(qr);
    const registros = await registrosController.getRegistros(qr);

    res.json({
        informacion,
        prestamos,
        registros
    });
});



module.exports = router;