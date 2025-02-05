import {Mensaje} from "../model/mensaje.ts";
import {createContext, ReactNode, useEffect, useState} from "react";


export interface PerfilContextType {
    mensaje: Mensaje;
    setMensaje: (mensaje: Mensaje) => void;
    state: boolean;
    setState: (state: boolean) => void
    enviarMensaje: (mensaje:object)=>void
}


export const MensajeContext = createContext<PerfilContextType | undefined>(undefined);


type ContextProviderProps = {
    children: ReactNode;
}

export const MensajeProvider = ({children}: ContextProviderProps) => {
    const [state, setState] = useState(false);
    const [mensaje, setMensaje] = useState<Mensaje>({} as Mensaje);

    useEffect(() => {
        setState(mensaje !== null && Object.keys(mensaje).length > 0);
    }, [mensaje]);

    // un apartado rapido para enviar los mensajes:

    const enviarMensaje = async (mensaje:object) => {
        try {
            const response = await fetch("http://localhost:8083/mensaje_usuario",
                {
                    method: 'POST',
                    headers: {"Content-Type": "application/json"},
                    body: JSON.stringify(mensaje)
                })
            const data = await response.json();

            console.log("Mensaje Enviado: ", data);
        } catch (e) {
            console.error(e)
        }

    }


    return (
        <MensajeContext.Provider value={{mensaje, setMensaje, state, setState,enviarMensaje}}>
            {children}
        </MensajeContext.Provider>
    )

}