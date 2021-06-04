const jwt = require('jsonwebtoken');

module.exports.verifyToken = (req, res, next) => {
    const bearerHeader = req.headers['authorization'];
    if(typeof bearerHeader != 'undefined') {
        const token = bearerHeader.split(' ')[1];
        jwt.verify(token, process.env.KEY_SECRET, async (error, authData) => {
            if(!error) {
                next();
            } else {
                console.log(error);
                return res.status(400).json( { error: 'Su sesión ha expirado. Inicie sesión nuevamente' } );
            }
        });
    } else {
        res.status(400).json( { error : 'No existe una sesión activa. Por favor, Inicie sesión'} );
    }
}