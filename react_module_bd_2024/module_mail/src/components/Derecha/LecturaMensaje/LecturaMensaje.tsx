import './LecturaMensaje.css'
import {Mensaje} from "../../../model/mensaje.ts";


export const LecturaMensaje = ({mensaje}: { mensaje: Mensaje }) => {
    return (
        <>
            <div className="mensaje-detalle">
                <h1>{mensaje.idCarpeta} - {mensaje.idCategoria}</h1>
                <h2 className="mensaje-asunto">{mensaje.asunto} </h2>
                <>
                    <p className="mensaje-usuario">De: {mensaje.usuario} ({mensaje.nomPais})</p>
                    <p className="mensaje-destinatario">Para: {mensaje.destinatario}</p>
                    <p className="mensaje-lista-enviados">todos enviados:  </p>
                    { mensaje.listaDestinatariosCO.map((dest)=> <p>CO:  {dest.email} | </p>)}

                </>

                <p className="mensaje-fecha">Fecha: {mensaje.fechaAccion} - {mensaje.horaAccion}</p>
                <p className="mensaje-categoria">Categoría: {mensaje.idCategoria}</p>
                <hr/>
                <p className="mensaje-cuerpo">{mensaje.cuerpoMensaje}</p>
                <hr/>
                <h3> Lista de Archivos: </h3>
                { mensaje.listaArchivos.map((arc)=> <p> {arc.nomArchivo}.{arc.tipoArchivo} </p>)}


            </div>

        </>
    )
}