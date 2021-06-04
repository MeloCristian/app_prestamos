<template>
     <div class="card animate__animated animate__fadeIn animate__faster">
        <div class="card-header">
            <div class="estado">Estado actual del equipo: <span class="badge animate__animated animate__fadeInUp animate__fast" :class="estadosPC[estadoActualPC][0]">{{ estadosPC[estadoActualPC][1] }}</span></div>
        </div>
        <div class="card-body">
            <BoxInfo v-if="allInfo['informacion'][0]" :info="allInfo['informacion'][0]" :estadoActualPC="estadoActualPC" />
            <BoxPrestamo :estadoActualPC="estadoActualPC"/>
        </div>
    </div>
</template>

<script>
export default {
    name: 'AppCard',
    data() {
        return {
            estadosPC: {
                1: ['badge-success', 'disponible'],
                2: ['badge-default', 'prestado'],
                3: ['badge-warning', 'garantía - revisión'],
                4: ['badge-primary', 'devolucíon'],
            }
        }
    },
    computed: {
        allInfo() {
            return this.$store.state.all_info;
        },
        estadoActualPC() {
            // Comprobar si esta DISPONIBLE:
            // Si la fecha_fin del ultimo prestamo y la fecha fin del registro devolucion de dicho prestamo estan seteadas, quiere  decir que el equipo esta DISPONIBLE
            // Si el equipo no tiene prestamos, esta DISPONNIBLE

            // Comprobar si esta en GARANTÍA - REVISIÓN
            // Si el equipo en su ultimo prestamo, y en el ultimo registro de dicho prestamo el id_proceso es 1 Y la fecha_fin es null, quire decir que esta en GARANTÍA - REVISIÓN

            // Comprobar si esta en DEVOLUCIÓN
            // Si el equipo en su ultimo prestamo, y en el ultimo registro de dicho prestamo el id_proceso es 2 y la fecha_fin es null , quire decir que esta en DEVOLUCIÓN

            // Estados : 1 = Disponible, 2 - Prestado, 3 - Garantia, 4 - Devolución

            let estadoActual = 1;

            const prestamos = JSON.parse(JSON.stringify(this.allInfo.prestamos));
            // Si no hay prestamos quiere decir que el equipo esta en estado 1
            if(prestamos.length) {
                // Si hay prestamos...
                // Obtengo el id_prestamo mayor, que sería el ultimo prestamo realizado
                const id_prestamo = prestamos.reduce((ac, curr) =>  {
                    if(ac > curr.id_prestamo)
                        return ac
                    else
                        return curr.id_prestamo
                }, 0);

                const finalizado = prestamos.filter(p => p.id_prestamo == id_prestamo && p.fecha_fin);

                if (finalizado.length) {
                    return 1;
                }

                // Obtengo los registros
                const registros = JSON.parse(JSON.stringify(this.allInfo.registros));

                if(registros.length) {
                    // Si hay registros...
                    // Compruebo si hay devoluciones para el ultimo prestamo realizado
                    const devolucion = registros.filter(r => r.id_prestamo == id_prestamo && r.id_proceso == 2);
                    if(devolucion.length) {
                        // Si hay una devolucion compruebo que ya este terminada
                        if(devolucion[0].fecha_fin) {
                            //Si esta terminada quiere decir que el Equipo esta 1
                            estadoActual = 1;
                        } else {
                            // Si no esta terminada quiere decir que el equipo esta 4
                            estadoActual = 4;
                        }
                    } else {
                        // Si no hay devolucion...
                        // Obtengo todos los registros de garantias o revisiones
                        const garantias = registros.filter(r => r.id_prestamo == id_prestamo && r.id_proceso == 1);
                        if(garantias.length) {
                            // Si hay garantias...
                            // Obtengo el id_registro mayor, el cual es el ultimo registro realizado 
                            const id_registro = garantias.reduce(function (ac, crr) {
                                if(ac > crr.id_registro)
                                    return ac
                                else
                                    return crr.id_registro
                            }, 0);
                            // Con ese id_registro obtnego la ultima garantia realizada y verifico si esa garantia ya esta terminada
                            const ultimaGarantia = garantias.filter(g => g.id_registro == id_registro && g.fecha_fin);

                            if(ultimaGarantia.length) {
                                // Si hay una ultima garantia terminada, quiere decir que el equipo volvio al estudiante y esta 2 
                                estadoActual = 2;
                            } else {
                                // Si no hay ultima garantia terminada quiere decir que el equipo esta 3
                                estadoActual = 3;
                            }
                        } else {
                            // Si no hay garantias quiere decir que el equipo esta 2
                            estadoActual = 2; 
                        }
                    }
                } else {
                    // Si no hay ningun tipo de registros, quiere decir que el equipo esta 2
                    estadoActual = 2;
                }
            } else {
                // Si no hay prestamos, quiere decir que el quipo esta 1
                estadoActual = 1;
            }

            return estadoActual;
        }
    },
    components: {
        BoxInfo: () => import(/* webpackChunkName: "boxInfo" */ "./boxs/BoxInfo"),
        BoxPrestamo: () => import(/* webpackChunkName: "boxInfo" */ "./boxs/BoxPrestamo"),
    }
}
</script>

<style>
.opts-box {
    display: flex;
    justify-content: flex-end;
    flex-wrap: wrap;
    /* padding-top: 10px; */
}
.opts-box button {
    font-weight: 700;
    padding: 7px 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 3px;
    margin-top: 5px;
}
.opts-box button img {
    display: block;
    margin-right: 5px;
    width: 30px;
    height: auto;
}

@media (max-width: 600px) {
    .opts-box button span {
        display: none;
    }
    .opts-box button img {
        margin-right: 0;
    }
}
</style>