import './SeccionIzquierda.css'
import {GenericButton} from "../utils/GenericButton/GenericButton.tsx";
import {PropEmail} from "./PropEmail/PropEmail.tsx";

export const SeccionIzquierda = () =>
{
    return(
        <div className="seccionTipoM">
            <GenericButton text={"Nuevo Mensaje"} parentMethod={() => {
                console.log("NuevoMensaje")
            }}/>
            <PropEmail/>


        </div>
    )
}