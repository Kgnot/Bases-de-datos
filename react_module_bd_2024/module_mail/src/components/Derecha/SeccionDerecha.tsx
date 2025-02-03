import './SeccionDerecha.css'
import {useMensaje} from "../../hooks/useMenesaje.ts";
import {LecturaMensaje} from "./LecturaMensaje/LecturaMensaje.tsx";
import {CrearMensaje} from "./CrearMensaje/CrearMensaje.tsx";


export const SeccionDerecha = () => {
    const {mensaje, state} = useMensaje();

    if (mensaje.usuario === undefined && state) {
        return <div className="seccionDerecha"> No hay mensaje seleccionado</div>;
    }
    console.log(state)
    return (
        <div className="seccionDerecha">
            {/*TODO : Debemos crear un enum para diferentes estados, mas de uno, de parte de state: Sin mensaje | Nuevo mensaje | leer mensaje*/}
            {!state &&
                <>
                    <CrearMensaje/>
                </>}
            {state && <LecturaMensaje mensaje={mensaje}/>}
        </div>
    );
};