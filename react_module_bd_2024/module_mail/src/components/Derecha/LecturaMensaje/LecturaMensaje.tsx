import './LecturaMensaje.css'
import {Mensaje} from "../../../model/mensaje.ts";


export const LecturaMensaje = ({mensaje}:{mensaje:Mensaje}) =>
{
    return(
        <>
            <div className="mensaje-detalle">
                <h1>{mensaje.idCarpeta} - {mensaje.idCategoria}</h1>
                <h2 className="mensaje-asunto">{mensaje.asunto} </h2>
                {mensaje.idCarpeta === "recibido" && (
                    <><p className="mensaje-usuario">De: {mensaje.destinatario} ({mensaje.nomPais})</p><p
                        className="mensaje-destinatario">Para: {mensaje.usuario}</p></>)
                }
                {mensaje.idCarpeta === "enviado" && (
                    <>                <p className="mensaje-usuario">De: {mensaje.usuario} ({mensaje.nomPais})</p>
                        <p className="mensaje-destinatario">Para: {mensaje.destinatario}</p></>)
                }

                <p className="mensaje-fecha">Fecha: {mensaje.fechaAccion} - {mensaje.horaAccion}</p>
                <p className="mensaje-categoria">Categoría: {mensaje.idCategoria}</p>
                <hr/>
                <p className="mensaje-cuerpo">{mensaje.cuerpoMensaje}</p>
            </div>

        </>
    )
}