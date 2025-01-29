import './MensajeItem.css'
import {Mensaje} from "../../../model/mensaje.ts";
import {useMensaje} from "../../../hooks/useMenesaje.ts";


export const MensajeItem = ({mensaje}: { mensaje: Mensaje }) => {

    const {setMensaje} = useMensaje();

    const onClickHandler = (mensaje: Mensaje) => {
        setMensaje(mensaje);
        console.log("xd")
    }


    return (
        <div className="mensaje-container" onClick={() => onClickHandler(mensaje)}>
            <div className="mensaje-header">
                <span className="mensaje-usuario">{mensaje.usuario}</span>
                <span className="mensaje-hora">{mensaje.horaAccion}</span>
                <span className="mensaje-hora">{mensaje.fechaAccion}</span>
            </div>
            <div className="mensaje-asunto">{mensaje.asunto}</div>
            <div className="mensaje-cuerpo">{mensaje.cuerpoMensaje}</div>
        </div>
    );
}


