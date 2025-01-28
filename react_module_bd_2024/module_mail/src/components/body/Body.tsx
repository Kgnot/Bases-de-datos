import './Body.css'
import {SeccionIzquierda} from "../Izquierda/SeccionIzquierda.tsx";
import {SeccionMitad} from "../Mitad/SeccionMitad.tsx";
import {SeccionDerecha} from "../Derecha/SeccionDerecha.tsx";

export const Body = () =>
{
    return(
        <div className="body">
            <SeccionIzquierda/>
            <SeccionMitad/>
            <SeccionDerecha/>
        </div>
    )
}