import {MensajeContext} from "../context/mensajeContext.tsx";
import {useContext} from "react";


export const useMensaje = () => {
    const context = useContext(MensajeContext);
    if (!context) throw new Error("useMensaje must be used within an MensajeProvider");
    return context;
}