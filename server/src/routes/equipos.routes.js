const { Router } = require('express');
const router = Router();

// Controller
const equiposController = require('../controllers/equipos.controller');

router.get('/:qr', async (req, res) => {
    // Obtengo la información del equipo
    // Obtengo los prestamos que tiene el equipo
    // Obtengo los registros que se han hecho al equipo (Revisiones, garantias o devoluciones)

    let { qr } = req.params;

    const equipo = await equiposController.getOne(qr);

    if(equipo.error) {
        return res.status(400).json(equipo);
    }

    res.json({
        'informacion': equipo
    });
});

module.exports = router; 