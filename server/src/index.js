const express = require('express');
const app = express();
const cors = require('cors');
const morgan = require('morgan');
const path = require('path');
require('dotenv').config();

// Configuraciones
global.__dir = path.dirname(require.main.filename); // PATH del servidor

app.set('port', process.env.PORT || 3000);
app.use(cors());
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Rutas
const appRoutes = require('./routes/app.routes');
const equiposRoutes = require('./routes/equipos.routes');
const prestamosRoutes = require('./routes/prestamos.routes');
const revisionesRoutes = require('./routes/revisiones.routes');
const devolucionesRoutes = require('./routes/devoluciones.routes');

const archivosRoutes = require('./routes/archivos.routes');

app.use('/all', appRoutes);
app.use('/equipos', equiposRoutes);
app.use('/prestamos', prestamosRoutes);
app.use('/revisiones', revisionesRoutes);
app.use('/devoluciones', devolucionesRoutes);

// Ruta para los archivos
app.use('/', archivosRoutes);

// Iniciar servidor
app.listen(app.get('port'), () => {
    console.log(`Server on port: http://localhost:${app.get('port')}`);
});