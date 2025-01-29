import './Body.css'
import {SeccionIzquierda} from "../Izquierda/SeccionIzquierda.tsx";
import {SeccionMitad} from "../Mitad/SeccionMitad.tsx";
import {SeccionDerecha} from "../Derecha/SeccionDerecha.tsx";
import {MensajeProvider} from "../../context/mensajeContext.tsx";

export const Body = () => {
    return (
        <MensajeProvider>
            <div className="body">
                <SeccionIzquierda/>
                <SeccionMitad/>
                <SeccionDerecha/>
            </div>
        </MensajeProvider>
    )
}