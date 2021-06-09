const { Router } = require('express');
const jwt = require('jsonwebtoken');
const router = Router();

// Controllers
const equiposController = require('../controllers/equipos.controller');
const prestamosController = require('../controllers/prestamos.controller');
const registrosController = require('../controllers/registros.controller');

const infoController = require('../controllers/info.controller');
const { verifyToken } = require('../helpers/jwt');

router.get('/is_logged', verifyToken, async (req, res) => {
    res.json({ logged: true });
});

router.get('/summary/:id_sede?', async (req, res) => {

    const { id_sede } = req.params;
    
    if( !id_sede ) {
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
    } else {
        const equipos = await equiposController.getTotalEquiposBySede( id_sede );
        const prestamos = await equiposController.getTotalPrestamosBySede( id_sede );
        const disponibles = await equiposController.getTotalDisponiblesBySede( id_sede );
        const revisiones = await equiposController.getTotalRevisiones();
        const devoluciones = await equiposController.getTotalDevoluciones();

        res.json({
            equipos,
            prestamos,
            disponibles,
            revisiones,
            devoluciones
        });
    }

});

router.get('/info', async (req, res) => {
    const sedes = await infoController.getSedes();
    const funcionarios = await infoController.getFuncionarios();
    res.json({
        sedes,
        funcionarios
    });
});

router.get('/comodatario/:dni', async (req, res) => {
    const { dni } = req.params;
    const comodatario = await infoController.getComodatario(dni);
    if(!comodatario.error) {
        res.json(comodatario);
    } else {
        res.status(400).json(comodatario);
    }
});

router.get('/:qr', verifyToken, async (req, res) => {
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

router.post('/login', async (req, res) => {

    try {
        const { user, password } = req.body;
        if(user.toLowerCase() == process.env.USER.toLowerCase() && password == process.env.PASSWORD) {
            const token = jwt.sign({ user }, process.env.KEY_SECRET);
            res.json( { token } );
        } else {
            res.status(400).json( { error: 'Datos erroneos. Inténtelo nuevamente' } );
        }
    } catch (error) {
        console.log(error);
        res.status(400).json(error);
    }

});


module.exports = router;