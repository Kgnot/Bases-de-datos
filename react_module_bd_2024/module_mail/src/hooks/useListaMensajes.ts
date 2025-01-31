import {useContext} from "react";
import {ListaMensajesContext} from "../context/listaMensajesContext.tsx";

export const useListaMensajes = () => {
    const context = useContext(ListaMensajesContext);
    if (!context) throw new Error("useListaMensajes must be used within an ListaMensajesProvider");
    return context;
}