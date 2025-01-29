import './SeccionDerecha.css'
import {useMensaje} from "../../hooks/useMenesaje.ts";


export const SeccionDerecha = () => {
    const { mensaje } = useMensaje();

    if (mensaje.usuario === undefined) {
        return <div className="seccionDerecha"> No hay mensaje seleccionado</div>;
    }
    console.log("mensaje : ",mensaje.usuario)
    return (
        <div className="seccionDerecha">
            <div className="mensaje-detalle">
                <h2 className="mensaje-asunto">{mensaje.asunto}</h2>
                <p className="mensaje-usuario">De: {mensaje.usuario} ({mensaje.nomPais})</p>
                <p className="mensaje-destinatario">Para: {mensaje.destinatario}</p>
                <p className="mensaje-fecha">Fecha: {mensaje.fechaAccion} - {mensaje.horaAccion}</p>
                <p className="mensaje-categoria">Categoría: {mensaje.idCategoria}</p>
                <hr />
                <p className="mensaje-cuerpo">{mensaje.cuerpoMensaje}</p>
            </div>
        </div>
    );
};