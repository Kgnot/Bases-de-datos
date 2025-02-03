import './SeccionIzquierda.css'
import {GenericButton} from "../utils/GenericButton/GenericButton.tsx";
import {PropEmail} from "./PropEmail/PropEmail.tsx";
import {Logout} from "../utils/Logout/Logout.tsx";
import {useMensaje} from "../../hooks/useMenesaje.ts";
import {Mensaje} from "../../model/mensaje.ts";

export const SeccionIzquierda = () =>
{
    const {setState,setMensaje} = useMensaje();

    return(
        <div className="seccionTipoM">
            <GenericButton text={"Nuevo Mensaje"} parentMethod={() => {
                console.log("NuevoMensaje")
                setState(false);
                setMensaje({}as Mensaje);
            }}/>
            <PropEmail/>
            <Logout/>

        </div>
    )
}