import './SeccionMitad.css'
import {MensajeItem} from "./Mensaje/MensajeItem.tsx";
import {Mensaje} from "../../model/mensaje.ts";
import {useListaMensajes} from "../../hooks/useListaMensajes.ts";


export const SeccionMitad = () => {
    const {listaMensajes} = useListaMensajes();


    return (
        <>
            <div className="seccionMitad">
                {
                    listaMensajes?.map((mensaje: Mensaje, index: number) => (
                        <MensajeItem key={index} mensaje={mensaje}/>
                    ))
                }
            </div>

        </>
    )
}