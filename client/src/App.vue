<template>
    <div id="app">
        <RouterView />
        <AppModal />
    </div>
</template>

<script>
export default {
    name: 'App',
    components: {
        AppModal: () => import(/* webpackChunkName: 'appModal' */ './components/modales/AppModal') 
    }
}
</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap');
@import url('./assets/css/animate.css');
@import url('./assets/css/hint.min.css');
* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    font-family: 'Montserrat', sans-serif;
}
body {
    font-family: 'Montserrat', sans-serif;
    font-size: 16px;
    color: #565656;
    /* padding-top: 50px; */
}

body, * {
    outline: none;
}
	
h1,
h2,
h3,
h4,
h5,
h6 {
    font-weight: 400;
    margin-bottom: 30px;
}

h1 {
    font-size: 3.5em;
    line-height: 1.15;
}

h2 {
    font-size: 2.5em;
}

h3 {
    font-size: 1.825em;
    line-height: 1.4em;
}

h4 {
    font-size: 1.5em;
    line-height: 1.45em;
    margin-top: 20px;
    margin-bottom: 10px;
}
h6 {
    font-size: 1rem;
    font-weight: 700;
    text-transform: uppercase;
}
p {
    line-height: 1.61em;
    font-weight: 300;
    font-size: 1.2em;
}
a {
    text-decoration: none;
    cursor: pointer;
}
ul {
    list-style: none;
}
select {
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right .75rem center;
    background-size: 16px 12px;
    appearance: none;
}
.title {
    font-weight: 700;
    color: #9a9a9a;
    margin: 10px 0;
}

.container {
    width: 95%;
    max-width: 1300px;
    margin: 1rem auto;
}

.text-center {
    text-align: center;
}

.btn {
    font-weight: 400;
    font-weight: 700;
    font-size: .8571em;
    line-height: 1.35em;
    margin: 10px 3px;
    border: none;
    border-radius: .1875rem;
    padding: 11px 22px;
    cursor: pointer;
    background-color: #888;
    color: #fff;
    opacity: 0.9;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,-webkit-box-shadow .15s ease-in-out;
}
.btn:disabled {
    opacity: 0.5;
    pointer-events: none;
}
.btn:hover {
    -webkit-box-shadow: 0 8px 15px rgba(0,0, 0, .2);
    box-shadow: 0 8px 15px rgba(0,0, 0, .2);
    opacity: 1;
}
.btn-primary {
    background-color: #06446b;
}
.btn-info {
    background-color: #2ca8ff;
}
.btn-success {
    background-color: #51c54b;
}
.btn-danger {
    background-color: #ff3636cc;
}
.btn-warning {
    background-color: #ffb236;
}
.btn-round {
    border-width: 1px;
    border-radius: 30px;
    padding: 11px 23px;
}
.alerta {
    width: 95%;
    padding: 1rem;
    margin: 0 auto;
    font-weight: 400;
}
.alerta-success {
    background-color: #18ce0f;
    color: #fff;
}
.alerta-error {
    background-color: #ff3636cc;
    color: #fff;
}
/* .alerta-warning {
    background-color: #ffb236;
    color: #fff;
} */
.text-danger {
    color: #ff3636cc;
}
.form-control {
    display: block;
    width: 100%;
    border: 1px solid #e3e3e3;
    border-radius: 30px;
    color: #2c2c2c;
    font-size: .8571em;
    padding: 13px 20px;
    margin: 10px auto;
    transition: color .3s ease-in-out,border-color .3s ease-in-out,background-color .3s ease-in-out;
}
.form-control.danger {
    border-color: #ff3636cc;
}
.form-control:focus {
    border: 1px solid #0c6cac;
    /* border: 1px solid #0c446b; */
}

.badge {
    padding: 4px 8px;
    text-transform: uppercase;
    font-size: .7142em;
    line-height: 12px;
    background-color: #888;
    border: 1px solid #888;
    margin-bottom: 5px;
    color: #fff;
    border-radius: .875rem;
    font-weight: 700;
    text-align: center;
    vertical-align: baseline;
}
.badge-success {
    border-color: #51c54b;
    background-color: #51c54b;
}
.badge-primary {
    border-color: #2ca8ff;
    background-color: #2ca8ff;
}
.badge-info {
    border-color: #0c6cac;
    background-color: #0c6cac;
}
.badge-warning {
    border-color: #ffb236;
    background-color: #ffb236;
}
.badge-default {
    border-color: #888;
    background-color: #888;
}
.badge-summary {
    border-color: #06446b;
    background-color: #06446b;
}
.card {
    display: flex;
    flex-direction: column;
    background-color: #fff;
    border-radius: .25rem;
    border: 0;
    position: relative;
    box-shadow: 0 5px 25px 0 rgb(0 0 0 / 20%);
}

.card {
    position: relative;
    max-width: 820px;
    margin: 0 auto;
}
.card-header {
    padding: 10px 20px 0px 30%;
    text-align: right;
}
.estado {
    font-weight: 700;
    display: flex;
    justify-content: flex-end;
    align-items: center;
    padding: 7px 10px;
    border-bottom: 1px solid #888;
}
.estado .badge {
    margin-bottom: 0;
    margin-left: 10px;
}
.card-body {
    padding: 10px 20px 10px 25px;
}
.card-body .badge {
    border-radius: 0;
    /* margin-left: -10px; */
}
.box {
    border: 1px solid #888;
    font-size: 1.1em;
    margin: 0.5rem auto;
    background-color: #FFF;
}
.box .badge {
    width: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 5px 8px;
    margin-bottom: 0;
}
.box .badge img {
    display: block;
    width: 40px;
    height: auto;
    margin-right: 10px;
}
.box.registro {
    margin-left: 1rem;
}
.box-info {
    border-color: #0c6cac;
}

.box-warning {
    border-color: #ffb236;
}
.box-success {
    border-color: #51c54b;
}
.box-primary {
    border-color: #2ca8ff;
}
.box-summary {
    border-color: #06446b;
}

.box-content {
    padding: 10px 10px 15px 10px;
    line-height: 1.8;
}
.content {
    display: flex;
    justify-content: space-evenly;
    flex-wrap: wrap;
}
.content .row {
    display: flex;
    align-items: stretch;
    width: 32%;
    margin: 5px auto;
    border-radius: 15px;
    border: 1px solid #888;
    overflow: hidden;
}
.content.prestamo .row {
    width: 49%;
}
.content .row h6 {
    font-size: 0.8rem;
    margin: 0;
    padding: 5px 10px;
    color: #fff;
    background-color: #888;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
.content .row p {
    font-size: 0.9rem;
    padding: 5px 10px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
.content .row p a {
    display: flex;
    justify-content: center;
    align-items: center;
    font-weight: 700;
    color: #888888;
    transition: .3s ease all;
}
.content .row p a img {
    width: 23px;
    height: auto;
    margin-right: 5px;
}
.content .row p a:hover {
    color: #363636;
}
.content.info .row {
    border: 1px solid #0c6cac;
}
.content.info .row h6 {
    background-color: #0c6cac;
}
.content.primary .row {
    border: 1px solid #2ca8ff;
}
.content.primary .row h6 {
    background-color: #2ca8ff;
}
.content.success .row {
    border: 1px solid #51c54b;
}
.content.success .row h6 {
    background-color: #51c54b;
}
.content.warning .row {
    border: 1px solid #ffb236;
}
.content.warning .row h6 {
    background-color: #ffb236;
}

@media (max-width: 600px) {
    .box .badge {
        width: 100%;
    }
    .card-header {
        padding: 5px 10px 0px 5%;
    }
    .card-body {
        padding: 7px;
    }
    .container-prestamo {
        padding: 5px;
    }
    .box.registro {
        margin-left: 0.5rem;
    }
    .content .row {
        width: 100%;
    }
    .content.prestamo .row {
        width: 100%;
    }
}
</style>
